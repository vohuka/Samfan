<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

$data = json_decode(file_get_contents('php://input'), true);

$username = $data['username'] ?? '';
$password = $data['password'] ?? '';
$full_name = $data['fullName'] ?? '';
$email = $data['email'] ?? '';
$phone = $data['phone'] ?? '';
$address = $data['address'] ?? '';
$image_url = $data['imageUrl'] ?? ''; // Add this line

if (!$username || !$password || !$email) {
    echo json_encode(['success' => false, 'message' => 'Missing required fields']);
    exit;
}

// Check if username or email exists
$stmt = $conn->prepare("SELECT id FROM user WHERE username = ? OR email = ?");
$stmt->bind_param("ss", $username, $email);
$stmt->execute();
$stmt->store_result();
if ($stmt->num_rows > 0) {
    echo json_encode(['success' => false, 'message' => 'Username or email already exists']);
    exit;
}
$stmt->close();

$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

// Update the SQL query to include image_url
$stmt = $conn->prepare("INSERT INTO user (username, password, full_name, email, phone, address, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("sssssss", $username, $hashedPassword, $full_name, $email, $phone, $address, $image_url);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Signup failed']);
}
$stmt->close();
$conn->close();
?>