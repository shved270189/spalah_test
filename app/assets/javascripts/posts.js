$(document).on('turbolinks:load', function() {
  $(document).on('ajax:success', '.like_anchors', function(xhr, data, status) {
    $(xhr.currentTarget).closest('span.likes_post').html(data);
  });
});
var notifier = new Notify('ws://localhost:8080');
notifier.on('new_comments', function(data) {
  console.log(data);
  $('#' + data.commentable_type.toLowerCase() + '_comments_' + data.commentable_id + ' tbody')
  .prepend('<tr><td>' + data.user_name + '</td><td>' + data.text + '</td></tr>');
})
