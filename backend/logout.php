<?php
session_start();
require_once __DIR__ . '/cors.php';

session_unset();
session_destroy();

echo json_encode(['success' => true, 'message' => 'Logged out']);
?>