class BooksController < ApplicationController

  def index
    @books = policy_scope(Book).order(title: :asc)
  end

  def show
    @book = Book.find(params[:id])
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
    params.require(:book).permit(:title, :author, :published_date, :rating, :publisher, :category, :photo)
  end

end
