<?php
session_start();
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

// Check login status
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Please log in']);
    exit;
}

$user_id = $_SESSION['user_id'];

// Debug logs
file_put_contents(__DIR__ . '/upload_debug.log', "Upload attempt by user: $user_id\n", FILE_APPEND);
file_put_contents(__DIR__ . '/upload_debug.log', "POST: " . print_r($_POST, true) . "\n", FILE_APPEND);
file_put_contents(__DIR__ . '/upload_debug.log', "FILES: " . print_r($_FILES, true) . "\n", FILE_APPEND);

// Check file upload
if (!isset($_FILES['profile_image']) || $_FILES['profile_image']['error'] !== UPLOAD_ERR_OK) {
    echo json_encode(['success' => false, 'message' => 'No file uploaded or upload error']);
    exit;
}

// Check file type
$allowed_types = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/webp'];
$file_type = $_FILES['profile_image']['type'];

if (!in_array($file_type, $allowed_types)) {
    echo json_encode(['success' => false, 'message' => 'Invalid file format. Only JPG, PNG, GIF and WEBP are accepted']);
    exit;
}

// Check file size (max 2MB)
$max_size = 2 * 1024 * 1024; // 2MB
if ($_FILES['profile_image']['size'] > $max_size) {
    echo json_encode(['success' => false, 'message' => 'File too large. Maximum size is 2MB']);
    exit;
}

// Create directory if it doesn't exist
$upload_dir = "../frontend/public/images/profiles/";
if (!file_exists($upload_dir)) {
    mkdir($upload_dir, 0777, true);
    file_put_contents(__DIR__ . '/upload_debug.log', "Created directory: $upload_dir\n", FILE_APPEND);
}

// Log path information for debugging
file_put_contents(__DIR__ . '/upload_debug.log', "Upload dir: " . realpath($upload_dir) . "\n", FILE_APPEND);
file_put_contents(__DIR__ . '/upload_debug.log', "Dir exists: " . (file_exists($upload_dir) ? "Yes" : "No") . "\n", FILE_APPEND);
file_put_contents(__DIR__ . '/upload_debug.log', "Dir writable: " . (is_writable($upload_dir) ? "Yes" : "No") . "\n", FILE_APPEND);

// Generate unique filename
$file_name = $user_id . '_' . time() . '_' . basename($_FILES['profile_image']['name']);
$file_name = preg_replace('/[^a-zA-Z0-9_\-\.]/', '_', $file_name); // Sanitize filename
$upload_path = $upload_dir . $file_name;

// Move temporary file to target directory
if (move_uploaded_file($_FILES['profile_image']['tmp_name'], $upload_path)) {
    // Create relative path for database storage
    $relative_path = "/images/profiles/" . $file_name;
    
    file_put_contents(__DIR__ . '/upload_debug.log', "File uploaded successfully to: $upload_path\n", FILE_APPEND);
    file_put_contents(__DIR__ . '/upload_debug.log', "Relative path for DB: $relative_path\n", FILE_APPEND);
    
    echo json_encode([
        'success' => true, 
        'message' => 'Upload successful',
        'image_url' => $relative_path
    ]);
} else {
    file_put_contents(__DIR__ . '/upload_debug.log', "Failed to move file. Error: " . error_get_last()['message'] . "\n", FILE_APPEND);
    echo json_encode(['success' => false, 'message' => 'Failed to upload file']);
}
?>