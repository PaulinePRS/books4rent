class UsersController < ApplicationController
  def show
    @user = current_user
    @books = current_user.books
    @bookings = current_user.bookings
    authorize current_user
  end
end
