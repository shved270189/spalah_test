// function createComment(userName, message) {
//
//   var prom = new Promise(function(success, fail) {
//     $.ajax({
//       url: $('#new_comment').attr('action'),
//       dataType: 'json',
//       type: 'POST',
//       data: {
//         comment: {
//           text: message,
//           user_name: userName
//         }
//       }
//     }).done(function(data) {
//       success(data);
//     }).fail(function(data) {
//       fail(data);
//     });
//   });
//
//   return prom;
// }
$(document).on('turbolinks:load', function() {
  // $('#new_comment input[type="submit"]').on('click', function(event) {
  //   var userName = $('#comment_user_name').val();
  //   var message = $('#comment_text').val();
  //
  //   createComment(userName, message).then(function(data) {
  //     console.log('START DOM MONIPULATION!!');
  //     return data;
  //   }).then(function(data) {
  //     $('#comments tbody').prepend('<tr><td>' + data.user_name + '</td><td>' + data.text + '</td></tr>');
  //     $('#comment_text').val('');
  //   }).then(function () {
  //     console.log('END DOM MONIPULATION!!');
  //   }).catch(function(data) {
  //     alert('ERROR!!!');
  //   });
  //
  //   return false;
  // });

  $('#new_comment').on('ajax:success', function(xhr, data, status) {
    $('#comments tbody').prepend('<tr><td>' + data.user_name + '</td><td>' + data.text + '</td></tr>');
    $('#comment_text').val('');
  });

  // $('#refresh_comments').on('ajax:success', function(xhr, data, status) {
  //   $('#comments_wrapper').html(data);
  // });



  // $('#refresh_comments').on('click', function(event) {
  //   $.get(location.href + '/comments', function(data) {
  //     $('#comments_wrapper').html(data);
  //   })
  //   return false;
  // });
});
