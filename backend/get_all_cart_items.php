<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

// Fetch all cart items with user and product info
$sql = "SELECT 
    ci.id, 
    ci.user_id, 
    ci.product_id, 
    ci.quantity, 
    ci.status, 
    ci.added_at,
    u.username, 
    u.full_name,
    u.email,
    u.phone,
    u.address,
    p.name AS product_name, 
    p.price
FROM cart_items ci
JOIN user u ON ci.user_id = u.id
JOIN products p ON ci.product_id = p.id
ORDER BY ci.added_at DESC";

$result = $conn->query($sql);

if ($result) {
    $items = [];
    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }
    echo json_encode(['success' => true, 'items' => $items]);
} else {
    echo json_encode(['success' => false, 'message' => 'Error fetching cart items']);
}

$conn->close();
?>