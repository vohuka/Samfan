<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

// Check request method
$method = $_SERVER['REQUEST_METHOD'];

// Handle OPTIONS preflight request
if ($method === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// Get JSON data from request
$data = json_decode(file_get_contents('php://input'), true);
$action = $data['action'] ?? '';
$section = $data['section'] ?? '';

// Check for required fields
if (empty($action) || empty($section)) {
    echo json_encode(['success' => false, 'message' => 'Missing required parameters']);
    exit;
}

// Default values for reset action
$defaultContent = [
    'main_banner' => [
        'section_title' => 'Company Information',
        'title' => 'Mission & Values',
        'text' => 'Our commitment is to operate responsibly as a leading global company.'
    ],
    'about_desc' => [
        'text' => 'Samfan believes in creating innovative products that enhance people\'s lives. Our commitment to excellence drives everything we do.'
    ],
    'banner2' => [
        'title' => 'Samfan\'s Vision',
        'text' => 'To inspire the world with innovative technologies, products and design that enrich people\'s lives and contribute to social prosperity.'
    ],
    'banner3' => [
        'title' => 'Samfan\'s Core Values',
        'text' => 'Samfan believes that living by strong values is the key to good business. That\'s why these core values, together with a strict code of conduct, are at the heart of every decision the company makes.'
    ],
    'banner4' => [
        'title' => 'Samfan Business Principles',
        'text' => 'Our business principles serve as the foundation for our actions and strategies. We are committed to ethical business practices, environmental sustainability, and making a positive impact on society.'
    ],
    'ceo_info' => [
        'name' => 'John Smith',
        'title' => 'Chief Executive Officer',
        'details' => "Joined Samfan in 2010\nPreviously CEO of Tech Innovations Inc\nHolds an MBA from Harvard Business School\nLed the company through digital transformation",
        'image' => '../assets/ceo.jpg'
    ]
];

// Handle different actions
if ($action === 'save') {
    $content = $data['data'] ?? [];
    // Convert content to JSON
    $json_content = json_encode($content);
    
    // Check if section exists
    $stmt = $conn->prepare("SELECT id FROM about_content WHERE section = ?");
    $stmt->bind_param("s", $section);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        // Update existing section
        $stmt = $conn->prepare("UPDATE about_content SET content = ? WHERE section = ?");
        $stmt->bind_param("ss", $json_content, $section);
    } else {
        // Insert new section
        $stmt = $conn->prepare("INSERT INTO about_content (section, content) VALUES (?, ?)");
        $stmt->bind_param("ss", $section, $json_content);
    }
    
    $success = $stmt->execute();
    
    if ($success) {
        echo json_encode(['success' => true, 'message' => 'Section updated successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to update section: ' . $conn->error]);
    }
    
    $stmt->close();
} elseif ($action === 'reset') {
    // Check if the section exists in the default content
    if (!isset($defaultContent[$section])) {
        echo json_encode(['success' => false, 'message' => 'Invalid section']);
        exit;
    }
    
    // Get default content for the section
    $default = $defaultContent[$section];
    $json_content = json_encode($default);
    
    // Check if section exists in the database
    $stmt = $conn->prepare("SELECT id FROM about_content WHERE section = ?");
    $stmt->bind_param("s", $section);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        // Update existing section with default values
        $stmt = $conn->prepare("UPDATE about_content SET content = ? WHERE section = ?");
        $stmt->bind_param("ss", $json_content, $section);
    } else {
        // Insert new section with default values
        $stmt = $conn->prepare("INSERT INTO about_content (section, content) VALUES (?, ?)");
        $stmt->bind_param("ss", $section, $json_content);
    }
    
    $success = $stmt->execute();
    
    if ($success) {
        echo json_encode(['success' => true, 'message' => 'Section reset to default values successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to reset section: ' . $conn->error]);
    }
    
    $stmt->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid action']);
}

$conn->close();
?>