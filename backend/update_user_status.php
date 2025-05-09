<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}


$data = json_decode(file_get_contents('php://input'), true);
$userId = isset($data['userId']) ? intval($data['userId']) : 0;
$status = isset($data['status']) ? $data['status'] : '';

if ($userId <= 0 || !in_array($status, ['active', 'inactive'])) {
    echo json_encode(['success' => false, 'message' => 'Invalid user ID or status']);
    exit;
}

// Update the user status
$stmt = $conn->prepare("UPDATE user SET status = ? WHERE id = ?");
$stmt->bind_param("si", $status, $userId);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'User status updated successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to update user status: ' . $conn->error]);
}

$stmt->close();
$conn->close();
?>