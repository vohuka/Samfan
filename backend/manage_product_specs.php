<?php
ini_set('display_errors', 0);
error_reporting(E_ERROR | E_PARSE);

require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

header('Content-Type: application/json');

try {
    $method = $_SERVER['REQUEST_METHOD'];
    $data = json_decode(file_get_contents('php://input'), true);
    $action = $_GET['action'] ?? ($data['action'] ?? '');

    // Get product specs categories (for dropdown options)
    if ($method === 'GET' && $action === 'categories') {
        $categories = ['processor', 'display', 'camera', 'storage', 'connectivity', 'network', 'physical'];
        echo json_encode(['success' => true, 'categories' => $categories]);
        exit;
    }

    // Add a new spec
    if ($method === 'POST' && $action === 'add') {
        $product_id = $data['product_id'] ?? 0;
        $category = $data['category'] ?? '';
        $spec_key = $data['spec_key'] ?? '';
        $spec_value = $data['spec_value'] ?? '';
        
        if (!$product_id || !$category || !$spec_key || !$spec_value) {
            echo json_encode(['success' => false, 'message' => 'Missing required fields']);
            exit;
        }
        
        $stmt = $conn->prepare("INSERT INTO product_specs (product_id, category, spec_key, spec_value) VALUES (?, ?, ?, ?)");
        
        if (!$stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }
        
        $stmt->bind_param("isss", $product_id, $category, $spec_key, $spec_value);
        
        $success = $stmt->execute();
        if (!$success) {
            throw new Exception("Execute failed: " . $stmt->error);
        }
        
        $spec_id = $conn->insert_id;
        $stmt->close();
        echo json_encode(['success' => $success, 'id' => $spec_id]);
        exit;
    }

    // Edit an existing spec
    if ($method === 'POST' && $action === 'edit') {
        $id = $data['id'] ?? 0;
        $product_id = $data['product_id'] ?? 0;
        $category = $data['category'] ?? '';
        $spec_key = $data['spec_key'] ?? '';
        $spec_value = $data['spec_value'] ?? '';
        
        if (!$id || !$product_id || !$category || !$spec_key || !$spec_value) {
            echo json_encode(['success' => false, 'message' => 'Missing required fields']);
            exit;
        }
        
        $stmt = $conn->prepare("UPDATE product_specs SET category=?, spec_key=?, spec_value=? WHERE id=? AND product_id=?");
        
        if (!$stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }
        
        $stmt->bind_param("sssii", $category, $spec_key, $spec_value, $id, $product_id);
        
        $success = $stmt->execute();
        if (!$success) {
            throw new Exception("Execute failed: " . $stmt->error);
        }
        
        $stmt->close();
        echo json_encode(['success' => $success]);
        exit;
    }

    // Delete a spec
    if ($method === 'POST' && $action === 'delete') {
        $id = $data['id'] ?? 0;
        $product_id = $data['product_id'] ?? 0;
        
        if (!$id || !$product_id) {
            echo json_encode(['success' => false, 'message' => 'Missing id or product_id']);
            exit;
        }
        
        $stmt = $conn->prepare("DELETE FROM product_specs WHERE id=? AND product_id=?");
        
        if (!$stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }
        
        $stmt->bind_param("ii", $id, $product_id);
        
        $success = $stmt->execute();
        if (!$success) {
            throw new Exception("Execute failed: " . $stmt->error);
        }
        
        $stmt->close();
        echo json_encode(['success' => $success]);
        exit;
    }

    echo json_encode(['success' => false, 'message' => 'Invalid request']);

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage(),
    ]);
} finally {
    if (isset($conn)) {
        $conn->close();
    }
}
?>