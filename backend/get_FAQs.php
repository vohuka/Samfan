<?php
require_once __DIR__ . '/cors.php';
require_once __DIR__ . '/database.php';

$sql = "SELECT * FROM FAQ";
$result = $conn->query($sql);

$faqs = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $faqs[] = $row;
    }
}

echo json_encode($faqs);

$conn->close();
?>