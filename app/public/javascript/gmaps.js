var Gmaps = function() {
  this.geocoder;
  this.map;
}

Gmaps.prototype.initialize = function() {
  var mapOptions = {
  zoom: 8,
  center: {lat: -33.8666, lng: 151.1958}
  }
  this.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  // this.centerMap("Reading Rd, London, UK");
  // this.markMap("LS9 8PA");
};

Gmaps.prototype.centerMap = function(address) {
  this.geocoder = new google.maps.Geocoder();
  this.geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      this.map.setCenter(results[0].geometry.location);
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
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
};

Gmaps.prototype.getLatLong = function(address) {
  $.ajax({
    url: 'http://maps.googleapis.com/maps/api/geocode/json'
  });
};

var gmaps = new Gmaps();

google.maps.event.addDomListener(window, 'load', gmaps.initialize);