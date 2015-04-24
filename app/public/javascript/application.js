$(document).ready(function(){

  $('.user-forms--report-pothole').on('submit', function(event) {
      event.preventDefault();
      addressToCoords($('#street-name').val(), $('#town-name').val());
      return false;
    });

  $('#new_password_confirm').keyup(function(){
    if ($('#new_password').val() !== $('#new_password_confirm').val()) {
      $('#match-alert').text("Passwords Don't Match");
    } else {
      $('#match-alert').text("");
    }
  });

  $('#new_password').keyup(function() {
    if ($('#new_password').val().length < 6) {
      $('#length-alert').text("Password Too SHORT");
    } else {
      $('#length-alert').text("");
    }
  });

});
