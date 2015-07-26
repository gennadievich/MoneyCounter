$(document).ready(function(){

    $('#spendings-link').click(function(e){
        $('.earnings-div').hide();
        $('.spendings-div').fadeIn('slow');
        e.preventDefault();
    });

});