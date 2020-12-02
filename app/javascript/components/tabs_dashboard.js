import $ from 'jquery'

const tabsDash = () => {
  $('#pills-tab a').click(function(e) {
    e.preventDefault();
    $(this).tab('show');
  });

  // store the currently selected tab in the hash value
  $("ul.nav-pills > li > a").on("shown.bs.tab", function(e) {
    var id = $(e.target).attr("href").substr(1);
    window.location.hash = id;
  });

  // on load of the page: switch to the currently selected tab
  var hash = window.location.hash;
  $('#pills-tab a[href="' + hash + '"]').tab('show');
}

export { tabsDash }
