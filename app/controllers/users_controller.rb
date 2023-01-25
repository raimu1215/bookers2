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
    
    @users = current_user
  end

  def edit
    user_id = params[:id].to_i
  unless user_id == current_user.id
    redirect_to user_path
  end
    @newbook = Book.new
    @user = User.find(params[:id])
    @users = current_user
  end
  
  def create
    @user = User.new(book_params)
    @user.save
    redirect_to books_path
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :get_profile_image, :introduction)
  end
end
