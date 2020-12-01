const dateSelect = () => {
  const dates = document.querySelectorAll(".dateboxx");
  const inputdate =  document.querySelector("#booking_date");
  dates.forEach((element) => {
    element.addEventListener("click", (event) => {
      const red = document.querySelectorAll(".red");
      if(element.classList.contains("red")) {
        element.classList.remove("red");
      } else if (red.length > 0) {
        red.forEach((item) => {
          item.classList.remove("red");
        });
        element.classList.add("red");
        inputdate.value = element.id;
      } else {
      element.classList.add("red");
      inputdate.value = element.id;
      console.log(element.id)

      }
    })
  })
};

export { dateSelect }
