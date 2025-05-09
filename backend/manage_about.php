<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'OPTIONS') {
    http_response_code(200);
    exit;
}


$data = json_decode(file_get_contents('php://input'), true);
$action = $data['action'] ?? '';
$section = $data['section'] ?? '';


if (empty($action) || empty($section)) {
    echo json_encode(['success' => false, 'message' => 'Missing required parameters']);
    exit;
}


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


if ($action === 'save') {
    $content = $data['data'] ?? [];
    $json_content = json_encode($content);
    $stmt = $conn->prepare("SELECT id FROM about_content WHERE section = ?");
    $stmt->bind_param("s", $section);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        
        $stmt = $conn->prepare("UPDATE about_content SET content = ? WHERE section = ?");
        $stmt->bind_param("ss", $json_content, $section);
    } else {
        
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
    
    if (!isset($defaultContent[$section])) {
        echo json_encode(['success' => false, 'message' => 'Invalid section']);
        exit;
    }
    
    
    $default = $defaultContent[$section];
    $json_content = json_encode($default);
    
    
    $stmt = $conn->prepare("SELECT id FROM about_content WHERE section = ?");
    $stmt->bind_param("s", $section);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        
        $stmt = $conn->prepare("UPDATE about_content SET content = ? WHERE section = ?");
        $stmt->bind_param("ss", $json_content, $section);
    } else {
        
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