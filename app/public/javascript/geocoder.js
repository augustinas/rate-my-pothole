postLocationData = function(location) {
  $.ajax({
      url: "/potholes",
      method: "post",
      data: {
        location: location,
        street_name: $('#street-name').val(),
        town_name: $('#town-name').val()
      },
      success: function(redirect) {
        window.location.replace(redirect);
      }
    });
  };

addressToCoords = function(street, town) {
  $.ajax({
      url: "https://maps.googleapis.com/maps/api/geocode/json",
      data: {
        address: street + '+' + town
      },
      success: function(data) {
        postLocationData(data.results[0].geometry.location);
      }
    });
  };