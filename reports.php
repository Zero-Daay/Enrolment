<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Student enrolment report</title>
    <meta name="description" content="Student enrolment report">
    <meta name="author" content="Yujie Hu">
    <meta name="date" content="27/05/2023">

    <!-- Include DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f4;
        }

        h1 {
            background: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }

        .center {
            max-width: 960px;
            margin: 20px auto;
        }

        .student-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .student-table th, .student-table td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
    </style>

    <!-- Include jQuery and DataTables JS before closing body tag -->
</head>
<body>
<main>
    <h1>Student enrolments report</h1>

    <?php
    // index.php
    require_once 'Database.php';
    $config = require 'config.php';

    $db = new Database($config);
    $stmt = $db->query("
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
");


    if ($stmt->execute()): ?>
        <div class="center">
            <div>
                <input type="text" id="searchID" placeholder="Search by ID">
                <input type="text" id="searchStudentID" placeholder="Search by studentID">
                <input type="text" id="searchFirstname" placeholder="Search by firstname">
            </div>
            <table class="student-table" id="studentTable">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>StudentID</th>
                    <th>Firstname</th>
                    <th>Surname</th>
                    <th>CourseID</th>
                    <th>Course Description</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <?php while ($row = $stmt->fetchObject()): ?>
                    <tr>
                        <td><?= $row->EnrolmentID ?></td>
                        <td><?= $row->UserID ?></td>
                        <td><?= $row->FirstName ?></td>
                        <td><?= $row->Surname ?></td>
                        <td><?= $row->CourseID?></td>
                        <td><?= $row->Description?></td>
                        <td><?= $row->CompletionStatus?></td>
                    </tr>
                <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    <?php else:
        // Now we can use the function we have created earlier to display a nicely-formatted error message
        die(friendlyError($stmt->errorInfo()[2]));
    endif; ?>

</main>

<!-- Include jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Include DataTables -->
<script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function() {
        var table = $('#studentTable').DataTable();

        // Add event listeners for each of the search boxes
        $('#searchID').keyup(function() {
            table
                .columns(0)
                .search(this.value)
                .draw();
        });

        $('#searchStudentID').keyup(function() {
            table
                .columns(1)
                .search(this.value)
                .draw();
        });

        $('#searchFirstname').keyup(function() {
            table
                .columns(2)
                .search(this.value)
                .draw();
        });
    });

</script>

</body>
</html>
