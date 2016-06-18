var marker;
var handler = Gmaps.build('Google');
var markers;

// Toma del navegador las coordenadas y llama a una función usePosition que debe ser definida
// en la página que incluye a éste script
function getLocation()
{
    navigator.geolocation.getCurrentPosition(function(position){
            usePosition(position);
        }, function(error) {
                x.innerHTML = "Geolocation is not supported by this browser.";
        });
}

// usePosition es llamada desde getLocation.js
function usePosition(position) {
    $("#latitud").val(position.coords.latitude);
    $("#longitud").val(position.coords.longitude);
    // centro el mapa en la posición que envía el navegador
    handler.map.centerOn([position.coords.latitude, position.coords.longitude]);
}

// crea el mapa con los marcadores que se envían por parámetro
// el zoom se asigna de acuerdo a la página que se esté mostrando
function createMap(paramMarkers, zoom)
{
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        handler.fitMapToBounds();
        handler.addMarkers(paramMarkers); // markers =
	    handler.bounds.extendWith(markers);
        handler.getMap().setZoom(zoom);
    });
    
    document.write(paramMarkers.toJSON());
    centerMap();
}

// si el marcador es único, centra el mapa en la posición del marcador
// si es un array, centra en una posición fija
function centerMap()
{
     // si hay marcador, centrar el mapa en la posición del marcador
    if(markers != null && !Array.isArray(markers))
    {
        handler.map.setCenter(markers.getPosition());
    } else {
        handler.map.centerOn([-40.1552557,-71.3472031]);
    }
}

//funcion que genera un marker en la posicion donde se genero el evento del mouse
function listener(){
  // listener para agregar un marker. se permite sólo uno
  google.maps.event.addListener(handler.getMap(), 'click', function(event){
      $("#latitud").val(event.latLng.lat());
      $("#longitud").val(event.latLng.lng());
      addMarker(event.latLng);
  });
  
}

// si existe el marker, lo cambia a la nueva posición, si no exite lo crea
function addMarker(location)
{
    if (marker)
    {
        marker.setPosition(location);
    } else {
        marker = new google.maps.Marker({
            position: location,
            map: handler.getMap()
        });
    }
}


function getGeocodeLocation()
{
    var searchText = $('street').text()+" "+$('number').val()+" ,San Martin de los Andes";
    var geocoder = new google.maps.Geocoder();

    if(!geocoder) geocoder = new GClientGeocoder();

     geocoder.geocode({'address': searchText}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      handler.map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: handler.map,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });

}
