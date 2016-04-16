$(document).ready(function() {
  $("body").on("click", "#sign-up-link", function (event) {
    event.preventDefault();
    $("#registration_form").toggle();

  })

  $("body").on("click", "#log-in-link", function (event) {
    event.preventDefault();
    $("#login_form").toggle();
  })

});
