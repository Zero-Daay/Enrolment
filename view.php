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
    <link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>
<main>
    <h1>Student enrolments report</h1>

    <div class="center">
        <div>
            <label for="searchID"></label><input type="text" id="searchID" placeholder="Search by ID">
            <label for="searchStudentID"></label><input type="text" id="searchStudentID" placeholder="Search by studentID">
            <label for="searchFirstname"></label><input type="text" id="searchFirstname" placeholder="Search by firstname">
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
            <?php /** @var $enrolments */
            foreach ($enrolments as $row): ?>
                <tr>
                    <td><?= $row->EnrolmentID ?></td>
                    <td><?= $row->UserID ?></td>
                    <td><?= $row->FirstName ?></td>
                    <td><?= $row->Surname ?></td>
                    <td><?= $row->CourseID?></td>
                    <td><?= $row->Description?></td>
                    <td><?= $row->CompletionStatus?></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>

</main>

<!-- Include jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Include DataTables -->
<script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

<script src="script.js"></script>


</body>
</html>
