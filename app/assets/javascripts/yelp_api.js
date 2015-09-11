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
      var listItem = $('<li></li>');
      listItem.addClass("list-group-item");

      //row
      var rowResult = $("<div class='row'></div>");

      //column
      var imgColumn = $("<div class='col-md-4'></div>");

      var img = $('<img>');
      img.attr('src', data[i].image_url);
      imgColumn.append(img);


      //column
      var infoColumn = $("<div class='col-md-8'></div>");

      var anchor = $('<a></a>');
      anchor.text(data[i].name);
      anchor.prop('href', data[i].url);
      infoColumn.append(anchor);

      var rating_img = $('<img>');
      rating_img.addClass("rating");
      rating_img.attr('src', data[i].rating_image);
      infoColumn.append(rating_img);

      var location = data[i].location;

      for (var j = 0; j < location.length; j++){
        var address = $('<p></p>');
        address.text(data[i].location[j]);
        infoColumn.append(address);
      }

      rowResult.append(imgColumn);
      rowResult.append(infoColumn);

      listItem.append(rowResult);

      $('.results').append(listItem);
    }
  }
});

// ul
//   li
//     image   restaurant name as a link
//             rating image    number of reviews
//             location
//   li
// ul

// name: business.name,
// url: business.url,

// image_url: business.image_url,
// rating: business.rating,
// rating_image: business.rating_img_url_small,
// review: business.review_count,
// location: business.location.display_address
