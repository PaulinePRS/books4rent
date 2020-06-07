
const options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};


const fillNewFormWithCurrentPosition = () => {
  const locationIcon = document.getElementsByTagName("svg")[1];

  if(locationIcon) {
    locationIcon.addEventListener("click", () => {

    navigator.geolocation.getCurrentPosition((location, options) => {
      const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${location.coords.longitude},${location.coords.latitude}.json?access_token=pk.eyJ1IjoicGF1bGluZXBhcmlzcGFyaXMiLCJhIjoiY2s5MzQ1YTM1MDBqczNsbnlpbmlyamc3MiJ9.Vj6NnfP-oS2tIkX8cFV4NA`
      fetch(url)
        .then(response => response.json())
        .then((data) => {
          const addressInput = document.getElementById('book_address');
          addressInput.value = data['features'][0]['place_name'];
        });
    });
    });
  };
};

export { fillNewFormWithCurrentPosition };
