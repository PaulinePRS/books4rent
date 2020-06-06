
const options = {
  enableHighAccuracy: true
};

const addressField = document.getElementById('address-field');

const fillNewFormWithCurrentPosition = () => {
  navigator.geolocation.getCurrentPosition((location, options) => {
    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${location.coords.longitude},${location.coords.latitude}.json?access_token=pk.eyJ1IjoicGF1bGluZXBhcmlzcGFyaXMiLCJhIjoiY2s5MzQ1YTM1MDBqczNsbnlpbmlyamc3MiJ9.Vj6NnfP-oS2tIkX8cFV4NA`
    fetch(url)
      // .then(console.log(url))
      .then(response => response.json())
      .then((data) => {
        addressField.value = data['features'][0]['place_name'];
      });
  });
};

export { fillNewFormWithCurrentPosition };
