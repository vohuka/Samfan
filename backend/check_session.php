<?php
session_start();
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    
    $stmt = $conn->prepare("SELECT id, username, full_name, email, phone, address, image_url, status FROM user WHERE id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if ($user) {
        // Check if user account has been locked since their last login
        if ($user['status'] === 'inactive') {
            // Clear session if user has been locked
            session_unset();
            session_destroy();
            echo json_encode(['loggedIn' => false, 'message' => 'Account has been locked']);
        } else {
            echo json_encode([
                'loggedIn' => true,
                'user' => $user
            ]);
        }
    } else {
        echo json_encode(['loggedIn' => false]);
    }
    $stmt->close();
} else {
    echo json_encode(['loggedIn' => false]);
}
$conn->close();
?>