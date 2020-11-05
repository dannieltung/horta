import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 2000 });
  // duration em mileseconds
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker().setLngLat([ marker.lng, marker.lat ]).setPopup(popup).addTo(map);
  });
};

const initMapbox = () => {
  // o = () é pq em JS isso indica que é um método e ele deve sempre constar.
  const mapElement = document.getElementById('map');
  // vai buscar a div.map ou podemos colocar apenas map se for uma id unica.
  if (mapElement) {
  // apenas criar um const map caso mapElemente exista.
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }));
    // primeiro se cria o mapa para em seguida criar os markers
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
      // markers.forEach((marker) => {
      //   new mapboxgl.Marker()
      //     .setLngLat([ marker.lng, marker.lat ])
      //     .addTo(map);
      // });
      // a linha 34 esta substituindo todo o código acima comentado.
  }
};

export { initMapbox };
