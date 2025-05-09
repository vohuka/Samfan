<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

header('Content-Type: application/json');

$search = isset($_GET['search']) ? $_GET['search'] : '';
$sql = "SELECT id, username, full_name, email, phone, address, image_url, 
        CASE WHEN status IS NULL THEN 'active' ELSE status END AS status 
        FROM user";

if (!empty($search)) {
    $search = '%' . $search . '%';
    $sql .= " WHERE username LIKE ? OR full_name LIKE ? OR email LIKE ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $search, $search, $search);
} else {
    $stmt = $conn->prepare($sql);
}

$stmt->execute();
$result = $stmt->get_result();
$users = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
}

echo json_encode(['success' => true, 'users' => $users]);

$stmt->close();
$conn->close();
?>