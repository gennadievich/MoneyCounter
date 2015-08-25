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
                $('.flash').html('<div class="alert alert-success">' + data['message'] + '</div>');
                $('.login-div').hide();
            },

            error: function(data) {
                $('.flash').html('<div class="alert alert-warning">' + data.responseText + '</div>');
            }
        });

        e.preventDefault();
    });
});