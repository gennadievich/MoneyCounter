$(document).ready(function(){

    $('#earnings-link').click(function(e){
        $('.spendings-div').hide();
        $('.earnings-div').fadeIn('slow');
        e.preventDefault();
    });

});