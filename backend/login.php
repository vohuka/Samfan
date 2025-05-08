<?php
session_start();

require_once __DIR__ . '/cors.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once __DIR__ . '/database.php';

$data = json_decode(file_get_contents('php://input'), true);

$username = $data['username'] ?? '';
$password = $data['password'] ?? '';

if (!$username || !$password) {
    echo json_encode(['success' => false, 'message' => 'Missing username or password']);
    exit;
}

// Modified query to include status check
$stmt = $conn->prepare("SELECT * FROM user WHERE username = ?");
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if ($user && password_verify($password, $user['password'])) {
    // Check if user is active
    if ($user['status'] === 'inactive') {
        echo json_encode(['success' => false, 'message' => 'This account has been locked. Please contact an administrator.']);
        exit;
    }
    
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['username'] = $user['username'];
    echo json_encode(['success' => true, 'user' => [
        'id' => $user['id'],
        'username' => $user['username'],
        'full_name' => $user['full_name'],
        'email' => $user['email'],
        'phone' => $user['phone'],
        'address' => $user['address'],
        'image_url' => $user['image_url']
    ]]);
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid credentials']);
}
$conn->close();
?>