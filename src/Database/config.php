<?php
namespace App\Database;

// config.php

// Return an associative array that contains the database configuration details
return [
    // 'db' is the key to an array of database parameters
    'db' => [
        // The name of the database you want to connect to
        'name' => 'enrolment',

        // The hostname or IP address where your database server is located
        'host' => 'localhost',

        // The port number your database server is listening on
        'port' => '8080',

        // The username for authenticating with your database
        'username' => 'root',

        // The password for authenticating with your database
        'password' => 'root'
    ],
];
