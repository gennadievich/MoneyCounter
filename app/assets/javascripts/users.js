$(document).ready(function(){

    $('#chng-btn-link').click(function(e){
        $('.chng-pass-div').fadeIn('slow');
        $('#chng-btn-link').hide();
        $('#cancel-btn-link').toggle();
        e.preventDefault();
    });

    $('#cancel-btn-link').click(function(e){
        $('.chng-pass-div').fadeOut('fast');
        $('#cancel-btn-link').hide();
        $('#chng-btn-link').toggle();
        e.preventDefault();
    });

});