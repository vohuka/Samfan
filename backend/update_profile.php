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
$image_url = $data['imageUrl'] ?? null; // Add this line

// Update user profile with image URL
$stmt = $conn->prepare("UPDATE user SET full_name = ?, email = ?, phone = ?, address = ?, image_url = ? WHERE id = ?");
$stmt->bind_param("sssssi", $full_name, $email, $phone, $address, $image_url, $user_id);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Profile updated successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to update profile: ' . $conn->error]);
}

$stmt->close();
$conn->close();
?>