$(document).ready(function(){

  $('.user-forms--report-pothole').on('submit', function(event) {
      event.preventDefault();
      addressToCoords($('#street-name').val(), $('#town-name').val());
      return false;
    });

  $('#new_password_confirm').focus(function(){
    if ($('#new_password').val() !== $('#new_password_confirm').val()) {
      // $('#new_password_confirm').css({"background-color": "#FF8080", "color": "white"})
    $('#match-alert').text("Passwords Don't Match");
    };
  });

  $('#new_password').blur(function() {
    if ($('#new_password').val().length < 6) {
      $('#length-alert').text("Password Too SHORT");
    }
  });

});
