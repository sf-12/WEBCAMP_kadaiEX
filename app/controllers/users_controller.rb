class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @book = Book.new
    @books = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
