class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @book = Book.find(params[:book_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.book = @book
    @booking.user = current_user
    @booking.save

    redirect_to book_path(@book)

  end

private

  def booking_params
    params.require(:booking).permit(:begin_date, :end_date)
  end
end
