$(document).ready(function(){

    $('#chng-btn-link').click(function(e){
        $('.chng-pass-div').fadeIn('slow');
        $('#chng-btn-link').hide();
        $('.user-info').hide();
        $('#cancel-btn-link').toggle();
        e.preventDefault();
    });

    $('#cancel-btn-link').click(function(e){
        $('.chng-pass-div').hide();
        $('#cancel-btn-link').hide();
        $('.user-info').fadeIn('slow');
        $('#chng-btn-link').toggle();
        e.preventDefault();
    });

});