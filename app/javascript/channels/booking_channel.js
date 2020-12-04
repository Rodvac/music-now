import consumer from "./consumer";

const initBookingCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.bookingId;
    const userId = messagesContainer.dataset.userId;

    consumer.subscriptions.create({ channel: "BookingChannel", id: id }, {
      received(data) {
        if (userId != data.user_id) {
          messagesContainer.insertAdjacentHTML('beforeend', data.message); // called when data is broadcast in the cable
        }
        // const messages = document.querySelectorAll(".message-block")
        // const last_message = messages[messages.length - 1]
        // if (data.user_id == user_id) {
        //   last_message.classList.add("m-sender")
        // }else{
        //   last_message.classList.add("m-receiver")
        // }
      },
    });
  }
}



export { initBookingCable };
