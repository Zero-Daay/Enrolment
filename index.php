<?php
require_once 'Database.php';
$config = require 'config.php';

$db = new Database($config);

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$perPage = isset($_GET['perPage']) ? (int)$_GET['perPage'] : 20;

// sort and order parameters
$sort = $_GET['sort'] ?? 'EnrolmentID'; // default column to sort by
$order = isset($_GET['order']) && in_array(strtolower($_GET['order']), ['asc', 'desc']) ? $_GET['order'] : 'asc'; // default order

$search = $_GET['search'] ?? null;
$total = 0;
try {
    $enrolments = $db->getEnrolments($page, $perPage, $search, $sort, $order); // include sort and order parameters
    $total = $db->getTotalEnrolments($search);
} catch (Exception $e) {
    die($db->friendlyError($e->getMessage()));
}

$output = '';
foreach ($enrolments as $enrolment) {
    $output .= '<tr>';
    $output .= '<td>' . htmlspecialchars($enrolment->EnrolmentID) . '</td>';
    $output .= '<td>' . htmlspecialchars($enrolment->UserID) . '</td>';
    $output .= '<td>' . htmlspecialchars($enrolment->FirstName) . '</td>';
    $output .= '<td>' . htmlspecialchars($enrolment->Surname) . '</td>';
    $output .= '<td>' . htmlspecialchars($enrolment->CourseID) . '</td>';
    $output .= '<td>' . htmlspecialchars($enrolment->Description) . '</td>';
    $output .= '<td>' . htmlspecialchars($enrolment->CompletionStatus) . '</td>';
    $output .= '</tr>';
}
$data = [
    'output' => $output,
    'total' => $total
];

// Send JSON response back to the client
header('Content-Type: application/json');
echo json_encode($data);

