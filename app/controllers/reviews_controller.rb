class ReviewsController < ApplicationController
  before_action :set_book, only: [:new, :create]
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.book = @book
    @review.user = current_user
    authorize @review
    if @review.save
      update_ratings(@book)

      redirect_to book_path(@book)
    else
      redirect_to book_path(@book)
    end
  end

  def destroy
    @review.destroy

    redirect_to book_path(@review.book)
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    @review.update(review_params)

    redirect_to book_path(@review.book)
  end


  private

   def update_ratings(book)
    sum = 0
    book.reviews.each do |review|
      if review.ratings
        sum += review.ratings
      end
    end
    book.rating = sum/book.reviews.size
    book.save!
  end


  def review_params
    params.require(:review).permit(:content, :ratings)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
