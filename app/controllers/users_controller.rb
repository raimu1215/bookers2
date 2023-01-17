class UsersController < ApplicationController
  
  def index
    @newbook = Book.new
    @user = User.all
    @users = current_user
  end
  
  
  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.find(params[:id])
    @users = current_user
  end

  def edit
    @newbook = Book.new
    @user = User.all
    @users = current_user
  end
  
  def create
    @user = User.new(book_params)
    @user.save
    redirect_to books_path
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = 'You have updated user successfully.'
    redirect_to books_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
