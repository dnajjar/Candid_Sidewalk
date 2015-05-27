$(document).ready(function(){ 
  $('input[type="file"]').click(function(){
        
  function getLocation() {
    if (navigator.geolocation) {
     navigator.geolocation.getCurrentPosition(showPosition);
    }
  }
  
  function showPosition(position) {
        var longitude = position.coords.longitude;
        var latitude = position.coords.latitude;
        var location = [latitude, longitude];
       $('form').children().append('<input type="hidden" name="incident[location]" value=' + location + ' >'); 
    };

  getLocation(); 
  
  });
})
