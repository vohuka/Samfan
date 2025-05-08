<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

header('Content-Type: application/json');

$product_id = isset($_GET['product_id']) ? (int)$_GET['product_id'] : 0;

if ($product_id <= 0) {
    echo json_encode(['success' => false, 'message' => 'Invalid product ID']);
    exit;
}

$sql = "SELECT * FROM product_specs WHERE product_id = ? ORDER BY category, spec_key";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();

$specs = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $specs[] = $row;
    }
}

echo json_encode(['success' => true, 'specs' => $specs]);
$conn->close();
?>