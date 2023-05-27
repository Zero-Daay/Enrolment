<?php
// index.php
/**
 * Display friendly error message
 *
 * @param string $e Error Message
 * @param string $level Error level
 * @return string Formatted error message
 */
function friendlyError(string $e, string $level = 'Error'): string {
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

$config = require 'config.php';

$db = $config['db'];
$dsn = "mysql:host={$db['host']};port={$db['port']};dbname={$db['name']}";

try {
    $dbh = new PDO($dsn, $db['username'], $db['password']);
} catch (PDOException $e) {
    die(friendlyError($e->getMessage()));
}
