
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
