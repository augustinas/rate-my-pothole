describe('gmaps', function() {
  beforeEach(function() {
    gmaps = new Gmaps();
  });

  it('can retrieve geocoder JSON', function() {
    spyOn($, 'ajax');
    gmaps.getLatLong();
    expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('http://maps.googleapis.com/maps/api/geocode/json')
  });

  it('can initialize', function() {
    spyOn(gmaps, 'initialize');
    gmaps.initialize();
    expect(gmaps.initialize).toHaveBeenCalled();
  });

  it('can centre a map', function() {
    spyOn(gmaps, 'centerMap');
    gmaps.centerMap("London");
    expect(gmaps.centerMap).toHaveBeenCalledWith("London");
  });

  it('can mark a map with an address', function() {
    spyOn(gmaps, 'markMap');
    gmaps.markMap("London");
    expect(gmaps.markMap).toHaveBeenCalledWith("London");
  });

  it('can mark a map with coordinates', function() {
    spyOn(gmaps, 'markMapCoord');
    gmaps.markMapCoord(0.445, 51.233);
    expect(gmaps.markMapCoord).toHaveBeenCalledWith(0.445, 51.233);
  });
});