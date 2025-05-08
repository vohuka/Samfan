<?php
session_start();
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

header('Content-Type: application/json');

// Get the search keyword
$keyword = isset($_GET['keyword']) ? trim($_GET['keyword']) : '';

if (empty($keyword)) {
    echo json_encode(['success' => false, 'message' => 'Search keyword is required']);
    exit;
}

// Prepare and execute the query
$keyword = "%$keyword%";
$stmt = $conn->prepare("
    SELECT 
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
    WHERE p.name LIKE ?
    GROUP BY p.id, p.name, p.image, p.price, p.color, p.memory, p.ram
");
$stmt->bind_param("s", $keyword);
$stmt->execute();
$result = $stmt->get_result();
$products = $result->fetch_all(MYSQLI_ASSOC);

// Format the response
if ($products) {
    echo json_encode([
        'success' => true,
        'products' => $products
    ]);
} else {
    echo json_encode([
        'success' => false,
        'message' => 'No products found'
    ]);
}

$stmt->close();
$conn->close();
?>