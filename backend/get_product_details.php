<?php
require_once __DIR__ . '/cors.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once __DIR__ . '/database.php';

$product_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($product_id <= 0) {
    echo json_encode(['success' => false, 'message' => 'Invalid product ID']);
    exit;
}

// Fetch product details
$stmt = $conn->prepare("SELECT * FROM products WHERE id = ?");
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
$product = $result->fetch_assoc();

if (!$product) {
    echo json_encode(['success' => false, 'message' => 'Product not found']);
    exit;
}

// Fetch product specs
$specs = [
    'processor' => [],
    'display' => [],
    'camera' => [],
    'storage' => [],
    'connectivity' => [],
    'network' => [],
    'physical' => [],
];

// Fetch processor specs
$stmt = $conn->prepare("SELECT spec_key, spec_value FROM product_specs WHERE product_id = ? AND category = 'processor'");
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()) {
    $specs['processor'][$row['spec_key']] = $row['spec_value'];
}

// Fetch display specs
$stmt = $conn->prepare("SELECT spec_key, spec_value FROM product_specs WHERE product_id = ? AND category = 'display'");
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()) {
    $specs['display'][$row['spec_key']] = $row['spec_value'];
}

// Fetch camera specs
$stmt = $conn->prepare("SELECT spec_key, spec_value FROM product_specs WHERE product_id = ? AND category = 'camera'");
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()) {
    $specs['camera'][$row['spec_key']] = $row['spec_value'];
}

// Fetch storage specs
$stmt = $conn->prepare("SELECT spec_key, spec_value FROM product_specs WHERE product_id = ? AND category = 'storage'");
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()) {
    $specs['storage'][$row['spec_key']] = $row['spec_value'];
}

// Fetch connectivity specs
$stmt = $conn->prepare("SELECT spec_key, spec_value FROM product_specs WHERE product_id = ? AND category = 'connectivity'");
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()) {
    $specs['connectivity'][$row['spec_key']] = $row['spec_value'];
}

// Fetch network specs
$stmt = $conn->prepare("SELECT spec_key, spec_value FROM product_specs WHERE product_id = ? AND category = 'network'");
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()) {
    $specs['network'][$row['spec_key']] = $row['spec_value'];
}

// Fetch physical specs
$stmt = $conn->prepare("SELECT spec_key, spec_value FROM product_specs WHERE product_id = ? AND category = 'physical'");
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()) {
    $specs['physical'][$row['spec_key']] = $row['spec_value'];
}

echo json_encode([
    'success' => true,
    'product' => array_merge($product, ['specs' => $specs])
]);

$conn->close();
?>