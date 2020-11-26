import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// [...]
if (mapElement) {
  // [...]
  map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));
}
