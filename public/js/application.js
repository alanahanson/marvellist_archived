$(document).ready(function() {
  $("header").on("click", "#sign-up-link", function (event) {
    event.preventDefault();
    $("#registration_form").toggle();

  })

  $("header").on("click", "#log-in-link", function (event) {
    event.preventDefault();
    $("#login_form").toggle();
  })

});
