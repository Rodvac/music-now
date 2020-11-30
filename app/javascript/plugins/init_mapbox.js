import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const addCurrentPositionMarkerToMap = (map, currentPosition) => {
  const element = document.createElement('div');
  element.className = 'currentPosition';
  element.style.backgroundImage = `url('${currentPosition.image_url}')`;
  //element.style.backgroundSize = 'contain';
  element.style.width = '25px';
  element.style.height = '25px';
  element.style.color = "red";

  new mapboxgl.Marker()
    .setLngLat([ currentPosition.longitude, currentPosition.latitude ])
    //.setPopup(popup) // add this
    .addTo(map);
}

// const geolocateControl = (map) => {
//   map.addControl(
//     new mapboxgl.GeolocateControl({
//       positionOptions: {
//       enableHighAccuracy: true
//       },
//       trackUserLocation: true
//     })
//   );
// };

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  //geolocateControl(map);
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const currentPosition = JSON.parse(mapElement.dataset.currentPosition);
    console.log(currentPosition.latitude)
    const markers = JSON.parse(mapElement.dataset.markers);
    if (markers.length === 0) return;

    addMarkersToMap(map, markers);
    addCurrentPositionMarkerToMap(map, currentPosition);
    fitMapToMarkers(map, markers);
  }
};


export { initMapbox };
