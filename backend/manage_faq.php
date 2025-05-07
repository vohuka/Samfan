<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents('php://input'), true);
$action = $_GET['action'] ?? ($data['action'] ?? '');

if ($method === 'GET') {
    // Lấy danh sách FAQ
    $sql = "SELECT * FROM FAQ ORDER BY id DESC";
    $result = $conn->query($sql);
    $faqs = [];
    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $faqs[] = $row;
        }
    }
    echo json_encode(['success' => true, 'faqs' => $faqs]);
    $conn->close();
    exit;
}

if ($method === 'POST' && $action === 'add') {
    // Thêm FAQ mới
    $question = $data['question'] ?? '';
    $answer = $data['answer'] ?? '';
    if (!$question || !$answer) {
        echo json_encode(['success' => false, 'message' => 'Missing question or answer']);
        exit;
    }
    $stmt = $conn->prepare("INSERT INTO FAQ (question, answer) VALUES (?, ?)");
    $stmt->bind_param("ss", $question, $answer);
    $success = $stmt->execute();
    $stmt->close();
    echo json_encode(['success' => $success]);
    $conn->close();
    exit;
}

if ($method === 'POST' && $action === 'edit') {
    // Sửa FAQ
    $id = $data['id'] ?? 0;
    $question = $data['question'] ?? '';
    $answer = $data['answer'] ?? '';
    if (!$id || !$question || !$answer) {
        echo json_encode(['success' => false, 'message' => 'Missing id, question or answer']);
        exit;
    }
    $stmt = $conn->prepare("UPDATE FAQ SET question=?, answer=? WHERE id=?");
    $stmt->bind_param("ssi", $question, $answer, $id);
    $success = $stmt->execute();
    $stmt->close();
    echo json_encode(['success' => $success]);
    $conn->close();
    exit;
}

if ($method === 'POST' && $action === 'delete') {
    // Xóa FAQ
    $id = $data['id'] ?? 0;
    if (!$id) {
        echo json_encode(['success' => false, 'message' => 'Missing id']);
        exit;
    }
    $stmt = $conn->prepare("DELETE FROM FAQ WHERE id=?");
    $stmt->bind_param("i", $id);
    $success = $stmt->execute();
    $stmt->close();
    echo json_encode(['success' => $success]);
    $conn->close();
    exit;
}

echo json_encode(['success' => false, 'message' => 'Invalid request']);
$conn->close();
?>