function initialize() {
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    zoom: 12,
    // we need to update the center to the center point of the zip added
    center: new google.maps.LatLng(pins[0][1], pins[0][2]),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var marker, i;

  for (i = 0; i < pins.length; i++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(pins[i][1], pins[i][2]),
      map: map,
      title:pins[i][0]
    });
  };
}
