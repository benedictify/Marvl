  
  // var map;
  // var geocoder;
  
  // var markers = [];


  // function initMap() {
  //   map = new google.maps.Map(document.getElementById('map'), {
  //         center: {lat: 38.889330, lng: -77.035981},
  //         zoom: 10
  //   });

  //   geocoder = new google.maps.Geocoder();
  //   largeInfowindow = new google.maps.InfoWindow();
  //   var bounds = new google.maps.LatLngBounds();

  //   $.ajax({url: 'locations/all', method: 'GET', dataType: 'json'})

  //   .done(function(allLocations){
  //     for (var i = 0; i < allLocations.length; i++) {
      
  //       createMarker(allLocations[i]);
  //     }
  //   });

  //     // map.fitBounds(bounds);
  // }

  // function createMarker(locationObject) {
  //   var address = locationObject.street_address + ", " + locationObject.city + ", " + locationObject.state + ", " + locationObject.zip_code
  //   geocoder.geocode( { 'address': address }, function(results) {
  //     addressLatLng = results[0].geometry.location;
  //     debugger
  //     // map.setCenter(addressLatLng);
  //     var marker = new google.maps.Marker({
  //       map: map,
  //       title: locationObject.name,
  //       position: addressLatLng,
  //       animation: google.maps.Animation.DROP,
  //       id: locationObject.id
  //     });
  //     markers.push(marker);
  //     marker.addListener('click', function() {
  //       populateInfoWindow(this, largeInfowindow);
  //     });
  //     // bounds.extend(markers[i].position);
  //   });
  // }


  // function populateInfoWindow(marker, infowindow) {
  //   // Check to make sure the infowindow is not already opened on this marker.
  //   if (infowindow.marker != marker) {
  //     infowindow.marker = marker;
  //     infowindow.setContent('<a href="/locations/' + marker.id + '">' + marker.title + "</a>");
  //     infowindow.open(map, marker);
  //     // Make sure the marker property is cleared if the infowindow is closed.
  //     infowindow.addListener('closeclick',function(){
  //       infowindow.setMarker(null);
  //     });
  //   }
  // }

