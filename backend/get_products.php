<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

if ($conn->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $conn->connect_error]));
}

// Sửa SQL query để tính toán giá trị rating giống như trong search_products.php
$sql = "SELECT 
    p.id, 
    p.name, 
    p.image, 
    p.price, 
    p.color, 
    p.memory, 
    p.ram, 
    COALESCE(ROUND(AVG(r.rating), 1), 0) AS rating
FROM products p
LEFT JOIN ratings r ON p.id = r.product_id
GROUP BY p.id, p.name, p.image, p.price, p.color, p.memory, p.ram";

$result = $conn->query($sql);

$products = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
}

echo json_encode($products);

$conn->close();
?>