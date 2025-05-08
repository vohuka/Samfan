<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents('php://input'), true);
$action = $data['action'] ?? '';

if ($method === 'POST' && $action === 'updateStatus') {
    $id = $data['id'] ?? 0;
    $status = $data['status'] ?? '';
    
    if (!$id || !$status) {
        echo json_encode(['success' => false, 'message' => 'Missing id or status']);
        exit;
    }
    
    // Validate status
    $validStatuses = ['pending', 'processing', 'completed', 'canceled'];
    if (!in_array($status, $validStatuses)) {
        echo json_encode(['success' => false, 'message' => 'Invalid status']);
        exit;
    }
    
    $stmt = $conn->prepare("UPDATE cart_items SET status = ? WHERE id = ?");
    $stmt->bind_param("si", $status, $id);
    
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Status updated successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to update status']);
    }
    
    $stmt->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request']);
}

$conn->close();
?>