$(document).ready(function(){ 

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

      }
       getLocation();
  $('form').submit(function(e){
       e.preventDefault();
       
       $('form').unbind('submit').submit();

  });
})
