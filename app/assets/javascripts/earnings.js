$(document).ready(function(){

    $('#earnings-link').click(function(e){
        $('.spendings-div').hide();
        $('.earnings-div').fadeIn('slow');
        $('#cancel-link').fadeIn('slow');
        e.preventDefault();
    });

    $('#cancel-link').click(function(e){
        $('.earnings-div').fadeOut('fast');
        $('#cancel-link').fadeOut('fast');
        e.preventDefault();
    });

});