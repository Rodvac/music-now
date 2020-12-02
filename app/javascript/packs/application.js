// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import { initGeoloc } from '../plugins/init_geoloc'
// import { toggleClassOnSearchBar } from '../components/searchbar';
import { dateSelect } from '../components/dateselect';
import { timeSelect } from '../components/timeselect';
import { displayGraduation } from '../components/graduation';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initBookingCable } from "../channels/chatroom_channel";
import { tabsDash } from "../components/tabs_dashboard";

ScrollReveal().reveal('.card-studio', {delay: 500});
ScrollReveal().reveal('.card-room', {delay: 500});

document.addEventListener('turbolinks:load', () => {
  initGeoloc();
  // toggleClassOnSearchBar();
  dateSelect();
  timeSelect();
  initMapbox();
  ScrollReveal();
  ScrollReveal().reveal();
  displayGraduation();
  initAutocomplete();
  initChatroomCable ();
  tabsDash();
})




// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
