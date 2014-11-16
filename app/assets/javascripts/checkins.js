$('#create_checkin').on('click', function(e) {
  e.preventDefault();

  $.post('/checkins', {
    api_id: $('#checkin_movie_id').val(),
    comment: $('#checkin_comment').val(),
    share_facebook: $('#checkin_facebook').is(':checked'),
    share_twitter: $('#checkin_twitter').is(':checked')
  }).then(function() {
    window.location = '/';
  });
});