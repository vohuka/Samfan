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

    if ($method === 'GET') {
        
        $result = $conn->query("SELECT * FROM products ORDER BY id DESC");
        $products = [];
        
        if ($result) {
            while ($row = $result->fetch_assoc()) {
                $products[] = $row;
            }
            echo json_encode($products);
        } else {
            echo json_encode(['success' => false, 'message' => 'Error fetching products']);
        }
        exit;
    }

    if ($method === 'POST' && $action === 'add') {
        $name = $data['name'] ?? '';
        $price = $data['price'] ?? 0;
        $color = $data['color'] ?? '';
        $memory = $data['memory'] ?? '';
        $ram = $data['ram'] ?? '';
        $image = $data['image'] ?? '';
        
        if (!$name || !$price || !$image) {
            echo json_encode(['success' => false, 'message' => 'Missing name, price or image']);
            exit;
        }
        
        $stmt = $conn->prepare("INSERT INTO products (name, price, color, memory, ram, image) VALUES (?, ?, ?, ?, ?, ?)");
        
        if (!$stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }
        
        $price = (float)$price;
        
        if (!$stmt->bind_param("sdssss", $name, $price, $color, $memory, $ram, $image)) {
            throw new Exception("Binding parameters failed: " . $stmt->error);
        }
        
        $success = $stmt->execute();
        if (!$success) {
            throw new Exception("Execute failed: " . $stmt->error);
        }
        
        $stmt->close();
        echo json_encode(['success' => $success]);
        exit;
    }

    if ($method === 'POST' && $action === 'edit') {
        $id = $data['id'] ?? 0;
        $name = $data['name'] ?? '';
        $price = $data['price'] ?? 0;
        $color = $data['color'] ?? '';
        $memory = $data['memory'] ?? '';
        $ram = $data['ram'] ?? '';
        $image = $data['image'] ?? '';
        
        if (!$id || !$name || !$price || !$image) {
            echo json_encode(['success' => false, 'message' => 'Missing id, name, price or image']);
            exit;
        }
        
        $stmt = $conn->prepare("UPDATE products SET name=?, price=?, color=?, memory=?, ram=?, image=? WHERE id=?");
        
        if (!$stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }
        
        $price = (float)$price;
        $id = (int)$id;
        
        if (!$stmt->bind_param("sdssssi", $name, $price, $color, $memory, $ram, $image, $id)) {
            throw new Exception("Binding parameters failed: " . $stmt->error);
        }
        
        $success = $stmt->execute();
        if (!$success) {
            throw new Exception("Execute failed: " . $stmt->error);
        }
        
        $stmt->close();
        echo json_encode(['success' => $success]);
        exit;
    }

    if ($method === 'POST' && $action === 'delete') {
        $id = $data['id'] ?? 0;
        if (!$id) {
            echo json_encode(['success' => false, 'message' => 'Missing id']);
            exit;
        }
        $stmt = $conn->prepare("DELETE FROM products WHERE id=?");
        $stmt->bind_param("i", $id);
        $success = $stmt->execute();
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