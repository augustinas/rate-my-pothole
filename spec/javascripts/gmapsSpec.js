describe('gmaps', function() {
  beforeEach(function() {
    gmaps = new Gmaps();
  });

  it('can retrieve geocoder JSON', function() {
    spyOn($, 'ajax');
    gmaps.getLatLong();
    expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('http://maps.googleapis.com/maps/api/geocode/json')
  });
});