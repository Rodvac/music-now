const toggleClassOnSearchBar = () => {
  if (document.querySelector("form.search")) {
    const searchInputs = document.querySelectorAll("form.search input.form-control");
    searchInputs.forEach((input) => {
      input.addEventListener("focus",(event) => {
        event.currentTarget.parentElement.classList.toggle("focused")
      });
      input.addEventListener("blur",(event) => {
        event.currentTarget.parentElement.classList.toggle("focused")
      })
    })
  }
}

export { toggleClassOnSearchBar } ;
