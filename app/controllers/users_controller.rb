class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user == current_user
      @books = @user.books
      authorize @user
    else
      redirect_to books_path
    end
  end
end
