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
      $("#spin").show(); 
  });
  var opts = {
  lines: 17, // The number of lines to draw
  length: 0, // The length of each line
  width: 10, // The line thickness
  radius: 50, // The radius of the inner circle
  corners: 1, // Corner roundness (0..1)
  rotate: 29, // The rotation offset
  direction: 1, // 1: clockwise, -1: counterclockwise
  color: '#669999', // #rgb or #rrggbb or array of colors
  speed: 1.4, // Rounds per second
  trail: 10, // Afterglow percentage
  shadow: false, // Whether to render a shadow
  hwaccel: false, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: '50%', // Top position relative to parent
  left: '49.5%' // Left position relative to parent
  };
  var target = document.getElementById('spin');
  var spinner = new Spinner(opts).spin(target);
  $('#spin').hide();
  
});


