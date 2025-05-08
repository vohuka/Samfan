<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// Check if admin is logged in (you may want to add admin check here)
// if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
//     echo json_encode(['success' => false, 'message' => 'Unauthorized']);
//     exit;
// }

$data = json_decode(file_get_contents('php://input'), true);
$userId = isset($data['userId']) ? intval($data['userId']) : 0;
$newPassword = isset($data['newPassword']) ? $data['newPassword'] : '';

if ($userId <= 0 || empty($newPassword)) {
    echo json_encode(['success' => false, 'message' => 'Invalid user ID or password']);
    exit;
}

// Hash the password
$hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

$stmt = $conn->prepare("UPDATE user SET password = ? WHERE id = ?");
$stmt->bind_param("si", $hashedPassword, $userId);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Password reset successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to reset password: ' . $conn->error]);
}

$stmt->close();
$conn->close();
?>