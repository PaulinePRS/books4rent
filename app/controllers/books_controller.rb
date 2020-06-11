class BooksController < ApplicationController

  def index
    if params[:query]
      key = "%#{params[:query]}%"
      @books = policy_scope(Book).where("title @@ :search OR author @@ :search OR description @@ :search", search: key).order(title: :asc)
        if @books.empty?
           redirect_to root_path, alert: 'This book doesnt exist!'
        end
    else
      @books = policy_scope(Book).order(title: :asc)
    end
      @books = @books.geocoded # returns books with coordinates

      @markers = @books.map do |book|
        {
          lat: book.latitude,
          lng: book.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { book: book })
        }
    end

  end

  def show
    @book = Book.find(params[:id])
    @booking = Booking.new
    authorize @book
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    @book.lender = current_user
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
    authorize @book
  end



  def edit
    @book = Book.find(params[:id])
    authorize @book
  end


  def update
     @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Your book was successfully updated.'
    else
      render :edit
    end
    authorize @book
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(@book)
    authorize @book
  end



  private

  def book_params

    params.require(:book).permit(:title, :author, :rating, :category, :photo, :address)

  end

end
