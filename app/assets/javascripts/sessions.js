$(document).ready(function(){
    $('#login-btn').click(function(e){
        var email = $('#email-field').val();
        var password = $('#password-field').val();
        $.ajax({
            url: '/login',
            type: 'post',
            format: 'json',
            data: {email: email, password: password},

            success: function(data){
                $('.flash').show().html('<div class="alert alert-success">' + data['message'] + '</div>');
                $('.login-div').hide();
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