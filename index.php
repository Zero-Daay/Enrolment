<?php
require_once 'Database.php';
$config = require 'config.php';

$db = new Database($config);

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$perPage = isset($_GET['perPage']) ? (int)$_GET['perPage'] : 20;

$search = isset($_GET['search']) ? $_GET['search'] : null;
try {
    $enrolments = $db->getEnrolments($page, $perPage, $search);
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

echo $output;
