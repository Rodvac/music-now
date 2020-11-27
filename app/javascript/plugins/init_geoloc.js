const initGeoloc = () => {
  const button = document.querySelector("#near-me-btn")
  if (!button) return;

  button.addEventListener("click", (event) => {
    event.preventDefault();
    navigator.geolocation.getCurrentPosition((data) => {
      window.location.replace(`/studios?location[longitude]=${data.coords.longitude}&location[latitude]=${data.coords.latitude}&location[radius]=5`)
    })
  })
  const buttonNavbar = document.querySelector("#navbar-btn")
  if (!buttonNavbar) return;

  buttonNavbar.addEventListener("click", (event) => {
    event.preventDefault();
    navigator.geolocation.getCurrentPosition((data) => {
      window.location.replace(`/studios?location[longitude]=${data.coords.longitude}&location[latitude]=${data.coords.latitude}&location[radius]=100`)
    })
  })
}

export {initGeoloc}
