// Toma del navegador las coordenadas y llama a una función usePosition que debe ser definida
// en la página que incluye a éste script

// funciona en chrome
function getLocation() 
{
	navigator.geolocation.getCurrentPosition(function(position){
			usePosition(position);
		}, function(error) {
				x.innerHTML = "Geolocation is not supported by this browser.";
		});
}
