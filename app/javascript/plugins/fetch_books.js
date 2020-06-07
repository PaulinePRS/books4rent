// const fetchBooks = () => {
//   const button = document.getElementById("autocomplete");
//   button.addEventListener("click", () => {
//     const isbnInput = document.getElementById('isbn');
//     const isbnValue = isbnInput.value;
//     const url = `https://www.googleapis.com/books/v1/volumes?q=isbn:${isbnValue}&key=AIzaSyAjUjwm8lIrso2D-367SXkg3Kcz3Z_hKlU`;
//     fetch(url)
//       .then(response => response.json())
//       .then((data) => {
//         console.log(data);
//         const titleInput = document.getElementById('book_title');
//         const authorInput = document.getElementById('book_author');
//         titleInput.value = data['items'][0]['volumeInfo']['title'];
//         authorInput.value = data['items'][0]['volumeInfo']['authors'][0];
//       });
//   });
// }


const fetchBooks = () => {
  const button = document.getElementById("autocomplete");
  if(button) {
    button.addEventListener("click", () => {
      const bookSearchInput = document.getElementById('book-search');
      const bookSearchValue = bookSearchInput.value;
      console.log(bookSearchValue);
      const url = `https://www.googleapis.com/books/v1/volumes?q=${bookSearchValue}&orderBy=relevance&maxResults=1&key=AIzaSyAjUjwm8lIrso2D-367SXkg3Kcz3Z_hKlU`;
      console.log(url);
      fetch(url)
        .then(response => response.json())
        .then((data) => {
          console.log(data);
          const titleInput = document.getElementById('book_title');
          const authorInput = document.getElementById('book_author');
          const publisherInput = document.getElementById('book_publisher');
          const ratingInput = document.getElementById('book_rating');
          const publishedDateInput = document.getElementById('book_published_date');
          const descriptionInput = document.getElementById('book_description');
          titleInput.value = data['items'][0]['volumeInfo']['title'];
          authorInput.value = data['items'][0]['volumeInfo']['authors'][0];
          publisherInput.value = data['items'][0]['volumeInfo']['publisher'];
          ratingInput.value = data['items'][0]['volumeInfo']['averageRating'];
          publishedDateInput.value = data['items'][0]['volumeInfo']['publishedDate'];
          descriptionInput.value = data['items'][0]['volumeInfo']['description'];
        });
    });
  };
};


export { fetchBooks };
