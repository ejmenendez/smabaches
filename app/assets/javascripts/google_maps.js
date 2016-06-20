var marker;
var handler = Gmaps.build('Google');
var markers = new Array();

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
        //markers = handler.addMarkers(paramMarkers);  
	    handler.bounds.extendWith(markers);
       
    });
    
    // recorro el json wnviado con los datos de los marcadores, y los agrego al mapa
    $.each(paramMarkers, function(i, value) 
    {
        var myLatlng = new google.maps.LatLng(value.lat, value.lng);
        var myMarker = new google.maps.Marker({
        position: myLatlng,
        map: handler.getMap(),
        
        infowindow: new google.maps.InfoWindow({
            content: value.infowindow
            })
        });

        markers.push(myMarker);
    });
               
    centerMap();
    handler.getMap().setZoom(zoom);
}

// centra el mapa en la posición del primer marcador del mapa
function centerMap()
{
     // si hay marcador, centrar el mapa en la posición del marcador
    if(markers != null && markers.length > 0)
    {
        handler.map.centerOn(markers[0].getPosition());
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
    if (markers[0] != null)
    {
        markers[0].setPosition(location);
    } else {
        marker = new google.maps.Marker({
            position: location,
            map: handler.getMap()
        });
        markers[0] = marker;
    }
}


// geolocalizar a partir de calle - número
function getGeocodeLocation()
{
    var searchText = $("#street option:selected").text() +" "+ $('#publication_number').val()+" ,San Martín de los Andes";
    
    var geocoder = new google.maps.Geocoder();

    if(!geocoder) geocoder = new GClientGeocoder();

    geocoder.geocode({'address': searchText}, function(results, status) 
    {
        if (status === google.maps.GeocoderStatus.OK) {
            handler.map.centerOn(results[0].geometry.location);
            handler.getMap().setZoom(14);
            addMarker(results[0].geometry.location);
            $("#latitud").val(results[0].geometry.location.lat);
            $("#longitud").val(results[0].geometry.location.lng);
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
  });

}
