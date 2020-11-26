const displayGraduation = () => {
  const radius = document.querySelector("#location_radius")
  const button = document.querySelector("form.location input[type='submit']")
  const graduation = document.querySelector("#graduation span")
  if (!button) return;
  radius.addEventListener("change",(event) => {
    console.log(radius.value)
    graduation.innerHTML = radius.value
    button.click();
  })
}

export { displayGraduation }
