const fetchBooks = () => {
  const button = document.getElementById("autocomplete");
  if(button) {
    button.addEventListener("click", () => {
      const bookSearchInput = document.getElementById('book-search');
      const bookSearchValue = bookSearchInput.value;
      const url = `https://www.googleapis.com/books/v1/volumes?q=${bookSearchValue}&orderBy=relevance&maxResults=1&key=AIzaSyAjUjwm8lIrso2D-367SXkg3Kcz3Z_hKlU`;
      console.log(url);
      fetch(url)
        .then(response => response.json())
        .then((data) => {
          const titleInput = document.getElementById('book_title');
          const authorInput = document.getElementById('book_author');
          const ratingInput = document.getElementById('book_rating');
          const descriptionInput = document.getElementById('book_description');
          titleInput.value = data['items'][0]['volumeInfo']['title'];
          authorInput.value = data['items'][0]['volumeInfo']['authors'][0];
          ratingInput.value = data['items'][0]['volumeInfo']['averageRating'];
          descriptionInput.value = data['items'][0]['volumeInfo']['description'];
        });
    });
  };
};


export { fetchBooks };
