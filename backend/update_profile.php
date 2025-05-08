<?php
session_start();
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'User not logged in']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);
$user_id = $_SESSION['user_id'];
$full_name = $data['fullName'] ?? '';
$email = $data['email'] ?? '';
$phone = $data['phone'] ?? '';
$address = $data['address'] ?? '';
$image_url = $data['imageUrl'] ?? null;

// Check if password is being updated
$password_updated = false;
if (isset($data['password']) && !empty($data['password'])) {
    $new_password = $data['password'];
    $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);
    $password_updated = true;
    
    // Update user profile with password
    $stmt = $conn->prepare("UPDATE user SET full_name = ?, email = ?, phone = ?, address = ?, image_url = ?, password = ? WHERE id = ?");
    $stmt->bind_param("ssssssi", $full_name, $email, $phone, $address, $image_url, $hashed_password, $user_id);
} else {
    // Update user profile without changing password
    $stmt = $conn->prepare("UPDATE user SET full_name = ?, email = ?, phone = ?, address = ?, image_url = ? WHERE id = ?");
    $stmt->bind_param("sssssi", $full_name, $email, $phone, $address, $image_url, $user_id);
}

if ($stmt->execute()) {
    $response_message = $password_updated ? 
        'Profile and password updated successfully' : 
        'Profile updated successfully';
        
    echo json_encode(['success' => true, 'message' => $response_message]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to update profile: ' . $conn->error]);
}

$stmt->close();
$conn->close();
?>