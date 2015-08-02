$(document).ready(function(){

    $('#spendings-link').click(function(e){
        $('.earnings-div').hide();
        $('.spendings-div').fadeIn('slow');
        $('#cancel-link').fadeIn('slow');
        e.preventDefault();
    });

    $('#cancel-link').click(function(e){
        $('.spendings-div').fadeOut('fast');
        $('#cancel-link').fadeOut('fast');
        e.preventDefault();
    });

});