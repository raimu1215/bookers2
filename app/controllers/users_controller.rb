class UsersController < ApplicationController
  
  def index
    @newbook = Book.new
    @user = User.all
    @users = current_user
  end
  
  
  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.all
    @users = current_user
  end

  def edit
    @newbook = Book.new
    @user = User.all
    @users = current_user
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to books_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
