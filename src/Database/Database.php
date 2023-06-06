<?php


namespace App\Database;

use PDO;
use PDOException;

class Database {
    private $dbh;   // Database handler
    private $config; // Database configuration

    // Constructor of the Database class
    public function __construct(array $config) {
        $this->config = $config;
        $this->connect();
    }

    // Method to connect to the database using PDO (PHP Data Objects)
    private function connect() {
        $db = $this->config['db'];
        $dsn = "mysql:host={$db['host']};port={$db['port']};dbname={$db['name']}";
        try {
            $this->dbh = new PDO($dsn, $db['username'], $db['password']);
        } catch (PDOException $e) {
            die($this->friendlyError($e->getMessage()));
        }
    }

    /**
     * @throws Exception
     */
    // Method to fetch enrollments from the database
    public function getEnrolments($page, $perPage = 20, $search = null, $sort = 'EnrolmentID', $order = 'asc') {
        $offset = ($page - 1) * $perPage;

        // Whitelist possible column names and order directions to avoid SQL Injection
        $allowed_columns = ['EnrolmentID', 'UserID', 'FirstName', 'Surname', 'CourseID', 'Description', 'CompletionStatus'];
        $allowed_orders = ['asc', 'desc'];

        if (!in_array($sort, $allowed_columns)) {
            $sort = 'EnrolmentID';
        }
        if (!in_array(strtolower($order), $allowed_orders)) {
            $order = 'asc';
        }

        if ($search) {
            $search = "%$search%";
            $stmt = $this->dbh->prepare("
        SELECT 
            Enrolments.EnrolmentID,
            Users.UserID, 
            Users.FirstName, 
            Users.Surname,
            Courses.CourseID,
            Courses.Description,
            Enrolments.CompletionStatus
        FROM 
            Enrolments
        JOIN 
            Users ON Enrolments.UserID = Users.UserID
        JOIN 
            Courses ON Enrolments.CourseID  = Courses.CourseID
        WHERE 
            Users.FirstName LIKE :search OR
            Users.Surname LIKE :search OR
            Enrolments.EnrolmentID LIKE :search OR
            Users.UserID LIKE :search OR
            Courses.Description LIKE :search OR               
            Courses.CourseID LIKE :search
        ORDER BY $sort $order
        LIMIT $perPage OFFSET $offset
    ");
            $stmt->bindParam(':search', $search, PDO::PARAM_STR);
        } else {
            $stmt = $this->dbh->prepare("
            SELECT 
                Enrolments.EnrolmentID,
                Users.UserID, 
                Users.FirstName, 
                Users.Surname,
                Courses.CourseID,
                Courses.Description,
                Enrolments.CompletionStatus
            FROM 
                Enrolments
            JOIN 
                Users ON Enrolments.UserID = Users.UserID
            JOIN 
                Courses ON Enrolments.CourseID  = Courses.CourseID
            ORDER BY $sort $order    
            LIMIT $perPage OFFSET $offset
        ");
        }

        if ($stmt->execute()) {
            return $stmt->fetchAll(PDO::FETCH_OBJ);
        } else {
            throw new Exception($stmt->errorInfo()[2]);
        }
    }

    /**
     * @throws Exception
     */
    // Method to calculate the total number of enrollments
    public function getTotalEnrolments($search = null) {
        // Whitelist possible column names to avoid SQL Injection

        if ($search) {
            $search = "%$search%";
            $stmt = $this->dbh->prepare("
            SELECT 
                COUNT(*) as total
            FROM 
                Enrolments
            JOIN 
                Users ON Enrolments.UserID = Users.UserID
            JOIN 
                Courses ON Enrolments.CourseID  = Courses.CourseID
            WHERE 
                Users.FirstName LIKE :search OR
                Users.Surname LIKE :search OR
                Enrolments.EnrolmentID LIKE :search OR
                Users.UserID LIKE :search OR
                Courses.Description LIKE :search OR               
                Courses.CourseID LIKE :search
        ");
            $stmt->bindParam(':search', $search, PDO::PARAM_STR);
        } else {
            $stmt = $this->dbh->prepare("
            SELECT 
                COUNT(*) as total
            FROM 
                Enrolments
            JOIN 
                Users ON Enrolments.UserID = Users.UserID
            JOIN 
                Courses ON Enrolments.CourseID  = Courses.CourseID
        ");
        }

        if ($stmt->execute()) {
            $result = $stmt->fetch(PDO::FETCH_OBJ);
            return $result->total;
        } else {
            throw new Exception($stmt->errorInfo()[2]);
        }
    }

    // Method to insert a user record into the database
    public function insertUser($userID, $firstName, $surname) {
        $stmt = $this->dbh->prepare("INSERT INTO Users (UserID, FirstName, Surname) VALUES (?, ?, ?)");
        $stmt->execute([$userID, $firstName, $surname]);
    }

    // Method to format and display errors
    public function friendlyError(string $e, string $level = 'Error'): string {
        $date = date("Y-m-d H:i:s");
        return <<<END
        <div class="error-message center">
        <b>$level</b><br>
        Please contact system administrator.
        <pre>Error message: <br>$e</pre>
        <pre>Time: <br>$date</pre>
        </div>
        END;
    }

    // Method to insert an enrollment record into the database
    public function insertEnrolment($userID, $courseID, $completionStatus) {
        $stmt = $this->dbh->prepare("INSERT INTO Enrolments (UserID, CourseID, CompletionStatus) VALUES (?, ?, ?)");
        $stmt->execute([$userID, $courseID, $completionStatus]);
    }

}
