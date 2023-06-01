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
