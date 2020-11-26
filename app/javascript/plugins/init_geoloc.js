const initGeoloc = () => {
  const longitude = document.querySelector("#longitude")
  const latitude = document.querySelector("#latitude")
  navigator.geolocation.getCurrentPosition((data) => {
    longitude.value = data.coords.longitude
    latitude.value = data.coords.latitude
  })
}

export {initGeoloc}
