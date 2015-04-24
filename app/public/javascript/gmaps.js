var Gmaps = function() {
  this.geocoder;
  this.map;
}

Gmaps.prototype.initialize = function(mapname, zoom, lat, long) {
  var mapOptions = {
  zoom: zoom,
  center: {lat: lat, lng: long}
  }
  this.map = new google.maps.Map(document.getElementById(mapname), mapOptions);
  // this.centerMap("Reading Rd, London, UK");
};

Gmaps.prototype.centerMap = function(address, zoom) {
  this.geocoder = new google.maps.Geocoder();
  this.geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      this.map.setCenter(results[0].geometry.location);
      this.map.setZoom(zoom);
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
};

Gmaps.prototype.markMap = function(address) {
  this.geocoder = new google.maps.Geocoder();
  this.geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var marker = new google.maps.Marker({
        map: this.map,
        position: results[0].geometry.location
      });
      console.log(marker)
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
};

Gmaps.prototype.markMapCoord = function(lat, lng) {
  var marker = new google.maps.Marker({
    map: this.map,
    position: new google.maps.LatLng(lat,lng),
    title: 'test for dan'
  });
  console.log(lat);
};
