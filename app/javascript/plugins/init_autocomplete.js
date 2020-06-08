import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('book_address') || document.getElementsByClassName('mapboxgl-ctrl-geocoder--input')[0];
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
