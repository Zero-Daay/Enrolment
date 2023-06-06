// Trigger function when the document is ready
$(document).ready(function(){
    // Variables for current page, items per page, sort order, and search term
    let page = 1;
    const perPage = 20;
    let sort = '';
    let order = 'asc';
    let searchTerm = '';
    const visiblePages = 5;

    // Function to render page navigation buttons
    function renderPageButtons(totalPages){
        let start = Math.max(1, page - Math.floor(visiblePages / 2));
        let end = Math.min(totalPages, start + visiblePages - 1);
        start = Math.max(1, end - visiblePages + 1);
        let buttons = '';
        for (let i = start; i <= end; i++) {
            buttons += '<button class="page-button" data-page="' + i + '">' + i + '</button>';
        }
        $('#pages').html(buttons);
        $('.page-button').removeClass('active');
        $('.page-button[data-page="' + page + '"]').addClass('active');
    }

    // Function to load enrolment data from the server
    function loadEnrolments(){
        const data = {
            page: page,
            perPage: perPage,
            sort: sort,
            order: order,
            search: searchTerm
        };

        // AJAX call to fetch data from the server
        $.ajax({
            url: 'index.php',
            type: 'GET',
            data: data,
            success: function(response){
                // On successful response, populate the table with data
                $('#enrolments-table tbody').empty();
                $('#enrolments-table tbody').append(response.output);

                // Calculate total pages and render page buttons
                const totalPages = Math.ceil(response.total / perPage);
                renderPageButtons(totalPages);

                // Show page info
                $('#page-info').text('Page ' + page + ' of ' + totalPages + ', Total records: ' + response.total);

                // Enable/disable previous and next buttons based on page number
                $('#prev-button').prop('disabled', page === 1);
                $('#next-button').prop('disabled', page === totalPages || totalPages === 0);
            },
            error: function(jqXHR, textStatus, errorThrown){
                // Log any errors during the AJAX call
                console.error(textStatus, errorThrown);
            }
        });
    }

    // Load enrolments when the document is ready
    loadEnrolments();

    // Event handler for previous button click
    $('#prev-button').on('click', function(){
        if (page > 1) {
            page--;
            loadEnrolments();
        }
    });

    // Event handler for next button click
    $('#next-button').on('click', function(){
        page++;
        loadEnrolments();
    });

    // Event handler for search button click
    $('#search-button').on('click', function(){
        searchTerm = $('#search-field').val();
        page = 1; // reset to first page when search is performed
        loadEnrolments();
    });

    // Event handler for page button click
    $('#pages').on('click', '.page-button', function(){
        page = parseInt($(this).data('page'));
        loadEnrolments();
    });

    // Event handler for table header click (sort functionality)
    $('#enrolments-table th').on('click', function(){
        sort = $(this).data('sort');
        order = order === 'asc' ? 'desc' : 'asc'; // switch order
        loadEnrolments();
    });
});
