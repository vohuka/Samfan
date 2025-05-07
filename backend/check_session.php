<?php
session_start();
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $stmt = $conn->prepare("SELECT id, username, full_name, email, phone, address FROM user WHERE id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if ($user) {
        echo json_encode([
            'loggedIn' => true,
            'user' => $user
        ]);
    } else {
        echo json_encode(['loggedIn' => false]);
    }
    $stmt->close();
} else {
    echo json_encode(['loggedIn' => false]);
}
$conn->close();
?>