<?php
session_start();

$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
$allowed_origins = ['http://localhost:8080'];
if (in_array($origin, $allowed_origins)) {
    header("Access-Control-Allow-Origin: $origin");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Allow-Headers: Content-Type');
    header('Access-Control-Allow-Methods: POST, OPTIONS');
}
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once __DIR__ . '/database.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'You must be logged in to comment']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);
$product_id = $data['product_id'] ?? 0;
$comment = trim($data['comment'] ?? '');

if ($product_id <= 0 || empty($comment)) {
    echo json_encode(['success' => false, 'message' => 'Invalid product ID or comment']);
    exit;
}

$user_id = $_SESSION['user_id'];

$stmt = $conn->prepare("INSERT INTO comments (product_id, user_id, comment) VALUES (?, ?, ?)");
$stmt->bind_param("iis", $product_id, $user_id, $comment);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Comment posted successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to post comment']);
}

$conn->close();
?>