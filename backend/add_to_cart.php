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
$product_id = $data['product_id'] ?? null;
$quantity = $data['quantity'] ?? 1;

if (!$product_id) {
    echo json_encode(['success' => false, 'message' => 'Product ID is required']);
    exit;
}

$stmt = $conn->prepare("INSERT INTO cart_items (user_id, product_id, quantity) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE quantity = quantity + ?");
$stmt->bind_param("iiii", $user_id, $product_id, $quantity, $quantity);
if ($stmt->execute()) {
    $cartItemId = $conn->insert_id ?: $conn->prepare("SELECT id FROM cart_items WHERE user_id = ? AND product_id = ? LIMIT 1")->execute([$user_id, $product_id])->get_result()->fetch_row()[0];
    echo json_encode(['success' => true, 'cartItemId' => $cartItemId]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to add to cart']);
}
$stmt->close();
$conn->close();
?>