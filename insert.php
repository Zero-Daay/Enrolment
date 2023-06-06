<?php


require_once 'vendor/autoload.php'; // Path may vary based on your project structure
require_once 'src/Database/Database.php';
$config = require 'src/Database/config.php';

$db = new Database($config);

$faker = Faker\Factory::create();

for ($i =100; $i < 5000; $i++) { // Generate 5000 users
    $userID = $i+1; // Or any other logic to generate user ID
    $firstName = $faker->firstName;
    $surname = $faker->lastName;

    try {
        $db->insertUser($userID, $firstName, $surname);
    } catch (Exception $e) {
        die($db->friendlyError($e->getMessage()));
    }
}



for ($i = 200; $i < 100000; $i++) { // Generate 100000 records
    $enrolmentID = $i+1; // Or any other logic to generate enrolment ID
    $userID = $faker->numberBetween(1, 5000);
    $courseID = $faker->numberBetween(1, 25);
    $completionStatus = $faker->randomElement(['Completed', 'In progress', 'Not started']);

    try {
        $db->insertEnrolment($userID,$courseID,$completionStatus);
    } catch (Exception $e) {
        die($db->friendlyError($e->getMessage()));
    }
}


echo "Dummy data inserted successfully!";

