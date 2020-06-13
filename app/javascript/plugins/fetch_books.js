const fetchBookInfo = (bookInfoUrl) => {
  fetch(bookInfoUrl)
    .then(response => response.json())
    .then((data) => {
      const titleInput = document.getElementById('book_title');
      const authorInput = document.getElementById('book_author');
      const descriptionInput = document.getElementById('book_description');
      titleInput.value = data['items'][0]['volumeInfo']['title'];
      authorInput.value = data['items'][0]['volumeInfo']['authors'][0];
      descriptionInput.value = data['items'][0]['volumeInfo']['description'];
    });
  };

const fetchBookCover = (coverUrl) => {
  fetch(coverUrl)
    .then (response => response.json())
    .then ((data) => {
      const Cover = data['volumeInfo']['imageLinks']['medium'];
      console.log(Cover);
      const photoInput = document.getElementById('book_cover_url');
      console.log(photoInput);
      photoInput.value = Cover;
      const coverDisplayed = document.getElementById('cover');
      coverDisplayed.setAttribute('src', Cover);
    });
};

const getBookCoverUrl = (bookInfoUrl) => {
  fetch(bookInfoUrl)
    .then(response => response.json())
    .then((data) => {
      const coverUrl = data['items'][0]['selfLink'];
      fetchBookCover(coverUrl);
    });
};

const fetchBooks = () => {
  const button = document.getElementById("autocomplete");
  if(button) {
    button.addEventListener("click", () => {
      const bookSearchInput = document.getElementById('book-search');
      const bookSearchValue = bookSearchInput.value;
      const bookInfoUrl = `https://www.googleapis.com/books/v1/volumes?q=${bookSearchValue}&orderBy=relevance&maxResults=1&key=AIzaSyAjUjwm8lIrso2D-367SXkg3Kcz3Z_hKlU`;
      fetchBookInfo(bookInfoUrl);
      getBookCoverUrl(bookInfoUrl);
    });
  };
};

export { fetchBooks };
