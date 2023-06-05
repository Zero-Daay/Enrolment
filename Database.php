<?php

class Database {
    private $dbh;
    private $config;

    public function __construct(array $config) {
        $this->config = $config;
        $this->connect();
    }

    private function connect() {
        $db = $this->config['db'];
        $dsn = "mysql:host={$db['host']};port={$db['port']};dbname={$db['name']}";
        try {
            $this->dbh = new PDO($dsn, $db['username'], $db['password']);
        } catch (PDOException $e) {
            die($this->friendlyError($e->getMessage()));
        }
    }

    public function query(string $query) {
        $stmt = $this->dbh->prepare($query);
        if (!$stmt->execute()) {
            die($this->friendlyError($stmt->errorInfo()[2]));
        }
        return $stmt;
    }

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
            $search = "%{$search}%";
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
        ORDER BY {$sort} {$order}
        LIMIT {$perPage} OFFSET {$offset}
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
            ORDER BY {$sort} {$order}    
            LIMIT {$perPage} OFFSET {$offset}
        ");
        }

        if ($stmt->execute()) {
            return $stmt->fetchAll(PDO::FETCH_OBJ);
        } else {
            throw new Exception($stmt->errorInfo()[2]);
        }
    }





    public function friendlyError(string $e, string $level = 'Error'): string {
        $date = date("Y-m-d H:i:s");
        return <<<END
        <div class="error-message center">
        <b>$level</b><br>
        Please contact system administrator.
        <pre>Error message: <br>{$e}</pre>
        <pre>Time: <br>{$date}</pre>
        </div>
        END;
    }
}
