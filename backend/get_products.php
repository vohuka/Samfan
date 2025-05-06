<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Cho phép CORS

// Kết nối với MySQL
$host = 'localhost';
$user = 'root';
$password = ''; // Thay bằng mật khẩu MySQL của bạn nếu có
$database = 'samsung_products';

$conn = new mysqli($host, $user, $password, $database);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $conn->connect_error]));
}

// Truy vấn dữ liệu
$sql = "SELECT * FROM products";
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