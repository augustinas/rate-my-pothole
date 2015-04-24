$(document).ready(function(){

  var $matchAlert = $("#match-alert");
  var $lengthAlert = $("#length-alert");

  $('.user-forms--report-pothole').on('submit', function(event) {
      event.preventDefault();
      addressToCoords($('#street-name').val(), $('#town-name').val());
      return false;
    });

  $('#new_password_confirm').keyup(function(){
    if ($('#new_password').val() !== $('#new_password_confirm').val()) {
      $matchAlert.slideDown(600);
    } else {
      $matchAlert.slideUp(600);
    }
  });

  $('#new_password').keyup(function() {
    if ($('#new_password').val().length < 6) {
      $lengthAlert.slideDown(600);
    } else {
      $lengthAlert.slideUp(600);
    }
  });

});
