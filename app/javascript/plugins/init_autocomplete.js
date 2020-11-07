import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('product_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initAutocompleteForUser = () => {
  const addressInput2 = document.getElementById('user_delivery_address');
  if (addressInput2) {
    places({ container: addressInput2 });
  }
};

export { initAutocomplete };
export { initAutocompleteForUser };
