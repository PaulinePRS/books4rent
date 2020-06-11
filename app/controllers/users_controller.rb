class UsersController < ApplicationController
  def show
    @books = current_user.books
    authorize current_user
  end
end
