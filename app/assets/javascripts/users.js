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

    $('#register-btn').click(function(e){
        var email = $('#reg-email-field').val();
        var password = $('#reg-password-field').val();
        var confirmpassword = $('#reg-confirm-password-field').val();
        $.ajax({
            url:  '/users',
            type: 'post',
            format: 'json',
            data: {user: {email: email, password: password, password_confirmation: confirmpassword}},

            success: function(data){
                $('.flash').show().html('<div class="alert alert-success">' + data['message'] + '</div>');
                $('.register-div').hide();
                $('h1').fadeIn('fast');
                $('.unless-current-user').hide();
                $.ajax({
                    url: '/ifcurrentuser',
                    type: 'get',
                    format: 'html',
                    success: function(data){
                        $('.if-current-user').html(data);
                    }
                });

                $.ajax({
                    url: '/homepartial',
                    type: 'get',
                    format: 'html',

                    success: function(data){
                        $('.homepage-div').html(data);
                    }
                });
            },
            error: function(data) {
                $('.flash').show().html('<div class="alert alert-warning">' + data.responseText + '</div>');
            }
        });

        e.preventDefault();
    });

});