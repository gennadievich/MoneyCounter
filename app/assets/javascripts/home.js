$(document).ready(function(){

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


    $('.get-dollar-btn').click(function(e){
        $.ajax({
            url:  '/getcurrency',
            type: 'get',
            format: 'json',
            success: function(data){
                $('.currency').html(data['message']);
            }
        });
        e.preventDefault();
    });

});