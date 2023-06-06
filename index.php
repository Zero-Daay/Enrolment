<?php

// Include the Database connection class


require_once 'src/Database/Database.php';

// Load configuration parameters
$config = require 'src/Database/config.php';

// Create a new database instance with the configuration
$db = new Database($config);

// Set the current page number; default to 1 if not specified
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;

// Set the number of items per page; default to 20 if not specified
$perPage = isset($_GET['perPage']) ? (int)$_GET['perPage'] : 20;

// Set sort column and order. If not specified, default to sorting by 'EnrolmentID' in ascending order
$sort = $_GET['sort'] ?? 'EnrolmentID'; // default column to sort by
$order = isset($_GET['order']) && in_array(strtolower($_GET['order']), ['asc', 'desc']) ? $_GET['order'] : 'asc'; // default order

// Set the search parameter; default to null if not specified
$search = $_GET['search'] ?? null;

// Initialize the total number of enrolments
$total = 0;

try {
    // Fetch enrolments from the database with search, sort, and order parameters
    $enrolments = $db->getEnrolments($page, $perPage, $search, $sort, $order);

    // Get the total number of enrolments from the database
    $total = $db->getTotalEnrolments($search);
} catch (Exception $e) {
    // If there's an error, show a friendly error message and end the script
    die($db->friendlyError($e->getMessage()));
}

// Initialize the output string
$output = '';

// Loop through each enrolment, creating a table row for each
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

// Prepare the data to be sent back to the client
$data = [
    'output' => $output,
    'total' => $total
];

// Set the HTTP response content type to JSON
header('Content-Type: application/json');

// Echo the data as a JSON string
echo json_encode($data);
