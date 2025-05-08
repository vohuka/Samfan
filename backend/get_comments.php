<?php
require_once __DIR__ . '/cors.php';

require_once __DIR__ . '/database.php';

$product_id = isset($_GET['product_id']) ? (int)$_GET['product_id'] : 0;

if ($product_id <= 0) {
    echo json_encode(['success' => false, 'message' => 'Invalid product ID']);
    exit;
}

$stmt = $conn->prepare("
    SELECT c.id, c.comment, c.created_at, u.username, u.full_name 
    FROM comments c 
    JOIN user u ON c.user_id = u.id 
    WHERE c.product_id = ? 
    ORDER BY c.created_at DESC
");
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
$comments = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode(['success' => true, 'comments' => $comments]);

$conn->close();
?>