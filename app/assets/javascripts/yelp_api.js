// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  $('.search').click(function() {
    event.preventDefault();

    var form = $(this).parent();
    var url = form.attr('action');
    var method = form.attr('method');

    $.ajax(url, {
      type: method,
      data: { 'search_term' : $('#search_term').val(),
              'location' : $('#location').val()
            },
      success: function (data) {
        formatData(data);
      }
    });
  });

  function formatData(data) {
    $('.results').empty();

    for (var i = 0; i < data.length; i++) {
      var anchor = $('<a></a>');
      anchor.text(data[i].name);
      anchor.prop('href', data[i].url);

      $('.results').append(anchor);
      anchor.wrap('<li></li>');
    }
  }
});

// name: business.name,
// url: business.url,
// image_url: business.image_url,
// rating: business.rating,
// rating_image: business.rating_img_url_small,
// review: business.review_count,
// location: business.location.display_address
