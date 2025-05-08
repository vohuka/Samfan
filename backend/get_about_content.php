<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

// Query all sections from the database
$sql = "SELECT id, section, content, last_updated FROM about_content";
$result = $conn->query($sql);

$sections = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $section_name = $row['section'];
        $section_content = json_decode($row['content'], true);
        
        // Add database ID and last_updated to the content
        $section_content['id'] = $row['id'];
        $section_content['last_updated'] = $row['last_updated'];
        
        $sections[$section_name] = $section_content;
    }
    
    echo json_encode(['success' => true, 'sections' => $sections]);
} else {
    // Initialize with default content if the table is empty
    $defaultContent = initializeDefaultContent();
    echo json_encode(['success' => true, 'sections' => $defaultContent]);
}

$conn->close();

// Helper function to initialize default content
function initializeDefaultContent() {
    return [
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
            'image' => '../assets/ceo-photo.jpg'
        ]
    ];
}
?>