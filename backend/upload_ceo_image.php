<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

// Check if file was uploaded
if (!isset($_FILES['ceo_image']) || $_FILES['ceo_image']['error'] !== UPLOAD_ERR_OK) {
    echo json_encode(['success' => false, 'message' => 'No file uploaded or upload error']);
    exit;
}

// Validate file type
$allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
$fileType = $_FILES['ceo_image']['type'];

if (!in_array($fileType, $allowedTypes)) {
    echo json_encode(['success' => false, 'message' => 'Invalid file type. Only JPG, PNG, GIF, and WEBP are allowed']);
    exit;
}

// Validate file size (max 2MB)
$maxSize = 2 * 1024 * 1024; // 2MB in bytes
if ($_FILES['ceo_image']['size'] > $maxSize) {
    echo json_encode(['success' => false, 'message' => 'File too large. Maximum size is 2MB']);
    exit;
}

// Create upload directory if it doesn't exist
$targetDir = "../frontend/public/images/ceo/";
if (!file_exists($targetDir)) {
    mkdir($targetDir, 0777, true);
}

// Generate unique filename
$fileName = 'ceo_' . time() . '_' . basename($_FILES['ceo_image']['name']);
$fileName = preg_replace('/[^a-zA-Z0-9_\-\.]/', '_', $fileName); // Sanitize filename
$targetFile = $targetDir . $fileName;

// Move uploaded file to target directory
if (move_uploaded_file($_FILES['ceo_image']['tmp_name'], $targetFile)) {
    // Get the relative path for storage in DB
    $relativePath = "/images/ceo/" . $fileName;
    
    echo json_encode([
        'success' => true, 
        'message' => 'File uploaded successfully',
        'image_url' => $relativePath
    ]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to upload file']);
}
?>