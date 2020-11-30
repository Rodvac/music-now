const toggleClassOnSearchBar = () => {
  if (document.querySelector("form.search")) {
    const searchInputs = document.querySelectorAll(".search-hover");
    console.log(searchInputs)
    searchInputs.forEach((input) => {
      input.addEventListener("mouseover",(event) => {
        console.log("hello")
        event.currentTarget.classList.toggle("focused")
      });
      input.addEventListener("mouseout",(event) => {
        event.currentTarget.classList.toggle("focused")
      })
    })
  }
}

export { toggleClassOnSearchBar } ;
