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
    const mapElement = document.getElementById('map');
    if (marker.current_position) {
      const element = document.createElement('div');
      element.className = 'currentPosition';
      //element.style.backgroundImage = `url('https://i.etsystatic.com/10924369/r/il/96200a/961644812/il_570xN.961644812_fohw.jpg')`;
      //element.style.backgroundSize = 'contain';
      element.style.width = '24px';
      element.style.height = '24px';
      element.style.borderRadius = "16px";
      element.style.backgroundColor = "#475B63";
      element.style.backgroundSize = "cover";
      element.style.backgroundPosition = "center";
      element.style.textAlign = "center";
      element.style.color = "white";
      element.innerHTML = mapElement.dataset.currentUser;

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      //.setPopup(popup) // add this
      .addTo(map);

    }
    else {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(map);
    }
  });
};

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
    // console.log(currentPosition.latitude)
    const markers = JSON.parse(mapElement.dataset.markers);
    if (markers.length === 0) return;

    addMarkersToMap(map, markers);
    // addCurrentPositionMarkerToMap(map, currentPosition);
    fitMapToMarkers(map, markers);
  }
};


export { initMapbox };
