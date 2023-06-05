<!DOCTYPE html>
<html>
<head>
    <!-- include any necessary scripts, styles, meta tags -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<!-- Enrolment Table -->
<h1>Student Enrolments</h1>
<div id="search-container">
    <input id="search-field" type="text" placeholder="Search...">
    <button id="search-button">Search</button>
</div>
<table id="enrolments-table">
    <thead>
    <tr>
        <th>Enrolment ID</th>
        <th>User ID</th>
        <th>First Name</th>
        <th>Surname</th>
        <th>Course ID</th>
        <th>Course Description</th>
        <th>Completion Status</th>
    </tr>
    </thead>
    <tbody>
    <!-- Data will be inserted here by jQuery -->
    </tbody>
</table>

<!-- Pagination Buttons -->
<div id="pagination-buttons">
    <button id="prev-button">Previous</button>
    <button id="next-button">Next</button>
</div>

<!-- Ajax Script to Load Data -->
<script>
    $(document).ready(function(){
        var page = 1;
        var perPage = 20;

        function loadEnrolments(searchTerm){
            var data = {
                page: page,
                perPage: perPage
            };
            if(searchTerm){
                data.search = searchTerm;
            }
            $.ajax({
                url: 'index.php',
                type: 'GET',
                data: data,
                success: function(response){
                    // append response to your table
                    $('#enrolments-table tbody').empty();
                    $('#enrolments-table tbody').append(response);
                },
                error: function(jqXHR, textStatus, errorThrown){
                    console.error(textStatus, errorThrown);
                }
            });
        }

        // call the function on document ready to load first page
        loadEnrolments();

        // Previous button click event
        $('#prev-button').on('click', function(){
            if (page > 1) {
                page--;
                loadEnrolments();
            }
        });

        // Next button click event
        $('#next-button').on('click', function(){
            page++;
            loadEnrolments();
        });

        // Search button click event
        $('#search-button').on('click', function(){
            var searchTerm = $('#search-field').val();
            page = 1; // reset to first page when search is performed
            loadEnrolments(searchTerm);
        });
    });
</script>
</body>
</html>

</html>
