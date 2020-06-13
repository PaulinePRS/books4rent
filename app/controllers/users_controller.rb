class UsersController < ApplicationController
  def show
    @user = current_user
    @books = current_user.books
    @bookings = current_user.bookings
    authorize current_user
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: 'Your rating has been successfully updated'
    else
      render :edit
    end
    authorize @user
  end

    private

  def user_params

      params.require(:user).permit(:rating)

    end

end
