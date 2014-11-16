$('#search_movies').on('submit', function(e) {
  e.preventDefault();

  $.get('/tmdb/search', { query: $('#query').val() }).then(function(data) {
    var results = $('#search_results');

    results.children().remove();

    var collectionContent = '';

    data.forEach(function(item) {
      if (item.poster_path) {
        item.poster_path = TMDB.settings.base_url + TMDB.settings.poster_sizes[1] + item.poster_path;

        var template = '<li class="text-center" data-api_id="' + item.api_id + '" data-title="' + item.title + '" data-poster_path="' + item.poster_path + '"><img src="' + item.poster_path + '" /><br>' + item.title + '</li>';
        
        collectionContent += template;
      }
    });

    results.append(collectionContent);
  });
});

$('#search_movies').on('click', 'li', function() {
  var modal = $('#new-checkin');
  modal.find('h3').text('Agregar: ' + $(this).data('title'));
  modal.find('#checkin_image').attr('src', $(this).data('poster_path'));
  modal.find('#checkin_movie_id').val($(this).data('api_id'));
  modal.find('#checkin_comment').val('Estoy viendo ' + $(this).data('title'));

  modal.foundation('reveal', 'open');
});