<?php
session_start();
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';


if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Please log in']);
    exit;
}

$user_id = $_SESSION['user_id'];
$stmt = $conn->prepare("SELECT ci.*, p.name, p.price, p.memory, p.color, p.ram, p.image FROM cart_items ci JOIN products p ON ci.product_id = p.id WHERE ci.user_id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$cartItems = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode(['success' => true, 'cartItems' => $cartItems]);
$stmt->close();
$conn->close();
?>