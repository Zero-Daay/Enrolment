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
        <th data-sort="EnrolmentID">Enrolment ID</th>
        <th data-sort="UserID">User ID</th>
        <th data-sort="FirstName">First Name</th>
        <th data-sort="Surname">Surname</th>
        <th data-sort="CourseID">Course ID</th>
        <th data-sort="Description">Course Description</th>
        <th data-sort="CompletionStatus">Completion Status</th>
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
        var sort = '';
        var order = 'asc'; // default order
        var searchTerm = ''; // declare searchTerm here

        function loadEnrolments(){
            var data = {
                page: page,
                perPage: perPage,
                sort: sort,
                order: order,
                search: searchTerm // use searchTerm here
            };
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
            searchTerm = $('#search-field').val(); // assign searchTerm
            page = 1; // reset to first page when search is performed
            loadEnrolments();
        });

        // Table headers click event
        $('#enrolments-table th').on('click', function(){
            sort = $(this).data('sort'); // use the data-sort value
            order = order === 'asc' ? 'desc' : 'asc'; // switch order
            loadEnrolments();
        });
    });
</script>


</body>
</html>

</html>
