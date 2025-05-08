<?php
session_start();
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

// Đọc dữ liệu JSON từ request
$json_data = file_get_contents('php://input');
$data = json_decode($json_data, true);

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Please log in']);
    exit;
}

$user_id = $_SESSION['user_id'];
$itemId = $data['itemId'] ?? null;

if (!$itemId) {
    echo json_encode(['success' => false, 'message' => 'Item ID is required']);
    exit;
}

$stmt = $conn->prepare("DELETE FROM cart_items WHERE user_id = ? AND id = ?");
$stmt->bind_param("ii", $user_id, $itemId);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to remove item from cart']);
}

$stmt->close();
$conn->close();
?>