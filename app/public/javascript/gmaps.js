var geocoder, map;

function codeAddress(address) {
  geocoder = new google.maps.Geocoder();
  geocoder.geocode({
    'address': address
  }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
      var myOptions = {
        zoom: 8,
        center: results[0].geometry.location,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

      var marker = new google.maps.Marker({
        map: map,
        position: reults[0].geometry.map
      });

      google.maps.event.addDomListener(window, 'load', initialize);
    }
  });
}