$(document).ready(function(){
    $('#searchspendings').keyup(function(){
        var input = $('#searchspendings').val();

        $.ajax({
            url: '/search/searchspendings',
            type: 'get',
            format: 'json',
            data: {input: input},

            success: function(result){
                $('.firstone').hide();
                var end_result = '';
                $.each(result, function(index){
                    end_result +=
                        '<tr>'+
                            '<td>' + result[index].date + '</td>'+
                            '<td>' + result[index].category + '</td>'+
                            '<td>' + result[index].sum + '</td>'+
                            '<td>' + result[index].description + '</td>'+
                            '<td>' + '<a href="/users/'+result[index].user_id+'/spendings/'+result[index].id+'">I</a>' + '</td>'
                        '</tr>'
                });

                $('.testing').html(end_result);

            }
        });

    });
});