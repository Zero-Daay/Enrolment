<?php
require_once 'Database.php';
$config = require 'config.php';

$db = new Database($config);

try {
    $enrolments = $db->getEnrolments();
} catch (Exception $e) {
    die(friendlyError($e->getMessage()));
}

require 'view.php';
