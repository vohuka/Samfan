<?php
session_start();
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';


$json_data = file_get_contents('php://input');
$data = json_decode($json_data, true);

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Please log in']);
    exit;
}

$user_id = $_SESSION['user_id'];
$action = $data['action'] ?? '';
$itemId = $data['itemId'] ?? null;

if (!$itemId) {
    echo json_encode(['success' => false, 'message' => 'Item ID is required']);
    exit;
}

if ($action === 'increase') {
    $stmt = $conn->prepare("UPDATE cart_items SET quantity = quantity + 1 WHERE user_id = ? AND id = ?");
} elseif ($action === 'decrease') {
    $stmt = $conn->prepare("UPDATE cart_items SET quantity = GREATEST(1, quantity - 1) WHERE user_id = ? AND id = ?");
} elseif ($action === 'remove') {
    $stmt = $conn->prepare("DELETE FROM cart_items WHERE user_id = ? AND id = ?");
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid action']);
    exit;
}

$stmt->bind_param("ii", $user_id, $itemId);
if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to update cart']);
}
$stmt->close();
$conn->close();
?>