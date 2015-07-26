$(document).ready(function(){

    $('h1').fadeIn(1500);

    $('#login-link').click(function(e){
        $('.register-div').hide();
        $('h1').hide();
        $('.login-div').fadeIn('slow');
        e.preventDefault();
    });


    $('#register-link').click(function(e){
        $('.login-div').hide();
        $('h1').hide();
        $('.register-div').fadeIn('slow');
        e.preventDefault();
    });

    $('#home-link').click(function(e){
        $('.login-div').hide();
        $('.register-div').hide();
        $('h1').fadeIn('slow');
        e.preventDefault();
    });

});