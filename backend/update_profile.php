<?php
session_start();
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// Check login status
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Please log in']);
    exit;
}

$user_id = $_SESSION['user_id'];
$data = json_decode(file_get_contents('php://input'), true);

$fullName = $data['fullName'] ?? '';
$email = $data['email'] ?? '';
$phone = $data['phone'] ?? '';
$address = $data['address'] ?? '';
$imageUrl = $data['imageUrl'] ?? '';

// Validate required fields
if (empty($fullName) || empty($email) || empty($phone) || empty($address)) {
    echo json_encode(['success' => false, 'message' => 'All fields are required']);
    exit;
}

// Update user profile
$query = "UPDATE user SET full_name = ?, email = ?, phone = ?, address = ?";
$params = [$fullName, $email, $phone, $address];
$types = "ssss";

// Include image URL if provided
if (!empty($imageUrl)) {
    $query .= ", image_url = ?";
    $params[] = $imageUrl;
    $types .= "s";
}

// Add password update if provided
if (isset($data['password']) && !empty($data['password'])) {
    $password = password_hash($data['password'], PASSWORD_DEFAULT);
    $query .= ", password = ?";
    $params[] = $password;
    $types .= "s";
}

$query .= " WHERE id = ?";
$params[] = $user_id;
$types .= "i";

$stmt = $conn->prepare($query);
$stmt->bind_param($types, ...$params);

if ($stmt->execute()) {
    // Get updated user data
    $getUserStmt = $conn->prepare("SELECT id, username, full_name, email, phone, address, image_url FROM user WHERE id = ?");
    $getUserStmt->bind_param("i", $user_id);
    $getUserStmt->execute();
    $result = $getUserStmt->get_result();
    $user = $result->fetch_assoc();
    
    echo json_encode(['success' => true, 'message' => 'Profile updated successfully', 'user' => $user]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to update profile']);
}

$stmt->close();
$conn->close();
?>