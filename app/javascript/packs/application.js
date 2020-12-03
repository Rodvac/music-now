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
import { initBookingCable } from "../channels/booking_channel";
import { tabsDash } from "../components/tabs_dashboard";

ScrollReveal().reveal('.card-studio', {delay: 350});
ScrollReveal().reveal('.jamcard', {delay: 350});

ScrollReveal().reveal('.card0', {delay: 350});
ScrollReveal().reveal('.card1', {delay: 450});
ScrollReveal().reveal('.card2', {delay: 550});
ScrollReveal().reveal('.card3', {delay: 350});
ScrollReveal().reveal('.card4', {delay: 450});
ScrollReveal().reveal('.card5', {delay: 550});
ScrollReveal().reveal('.card6', {delay: 350});
ScrollReveal().reveal('.card7', {delay: 450});
ScrollReveal().reveal('.card8', {delay: 550});
ScrollReveal().reveal('.card9', {delay: 350});
ScrollReveal().reveal('.card10', {delay: 450});
ScrollReveal().reveal('.card11', {delay: 550});
ScrollReveal().reveal('.card12', {delay: 350});
ScrollReveal().reveal('.card13', {delay: 450});
ScrollReveal().reveal('.card14', {delay: 550});
ScrollReveal().reveal('.card15', {delay: 350});
ScrollReveal().reveal('.card16', {delay: 450});
ScrollReveal().reveal('.card17', {delay: 550});
ScrollReveal().reveal('.card18', {delay: 350});

document.addEventListener('turbolinks:load', () => {
  initGeoloc();
  // toggleClassOnSearchBar();
  dateSelect();
  timeSelect();
  initMapbox();
  ScrollReveal();
  displayGraduation();
  initAutocomplete();
  initBookingCable();
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
