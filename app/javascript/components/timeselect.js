const timeSelect = () => {
  const times = document.querySelectorAll(".timebox");
  const inputTime =  document.querySelector("#booking_time");
  times.forEach((element) => {
    element.addEventListener("click", (event) => {
      const red = document.querySelectorAll(".redtime");
      if(element.classList.contains("redtime")) {
        element.classList.remove("redtime");
      } else if (red.length > 0) {
        red.forEach((item) => {
          item.classList.remove("redtime");
        });
        element.classList.add("redtime");
      } else {
      element.classList.add("redtime");
      inputTime.value = element.innerHTML;
      }
    })
  })
};


export { timeSelect }