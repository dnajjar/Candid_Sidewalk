$(document).ready(function(){ 
  $('form').submit(function(e){
    e.preventDefault();
  function getLocation() {
    if (navigator.geolocation) {
     navigator.geolocation.getCurrentPosition(showPosition);
    }
  }
  
  function showPosition(position) {
        var longitude = position.coords.longitude;
        var latitude = position.coords.latitude;
        var location = [latitude, longitude];
       $('form').children().append('<input type="hidden" name="incident[latitude]" value=' + latitude + ' >');
       $('form').children().append('<input type="hidden" name="incident[longitude]" value=' + longitude + ' >');
       $('form').children().append('<input type="hidden" name="incident[location]" value=' + location + ' >');

       $('form').unbind('submit').submit();

    };

  getLocation(); 

  
  });
})
