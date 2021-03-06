var map;
var initialLocation;
var indonesia = new google.maps.LatLng(-0.789275, 113.921327);
var browserSupportFlag =  new Boolean();

function initialize() {
  var myOptions = {
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  
  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  // Try Google Gears Geolocation
  } else if (google.gears) {
    browserSupportFlag = true;
    var geo = google.gears.factory.create('beta.geolocation');
    geo.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.latitude,position.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeoLocation(browserSupportFlag);
    });
  // Browser doesn't support Geolocation
  } else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }
  
  function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      alert("deteksi lokasi gagal");
      initialLocation = indonesia;
    } else {
      alert("maaf, kami tidak bisa mendeteksi lokasi anda, kami mengarahkan ke Indonesia");
      initialLocation = indonesia;
    }
    map.setCenter(initialLocation);
  }
  
  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });
}

function placeMarker(location) {
  $("#store_latitude").val(location.lat());
  $("#store_longnitude").val(location.lng());
  var marker = new google.maps.Marker({
      position: location, 
      map: map
  });

  map.setCenter(location);
}
