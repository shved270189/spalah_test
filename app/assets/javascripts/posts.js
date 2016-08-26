$(function() {
  $('#new_comment input[type="submit"]').on('click', function(event) {
    var userName = $('#comment_user_name').val();
    var message = $('#comment_text').val();

    $.post($('#new_comment').attr('action'), {
      comment: {
        text: message,
        user_name: userName
      }
    }, function(data) {
      console.log(data.success);
      if (data.success) {
        $('#comments tbody').prepend('<tr><td>' + userName + '</td><td>' + message + '</td></tr>');
        $('#comment_text').val('');
      }
    });
    return false;
  });
});
