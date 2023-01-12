class UsersController < ApplicationController
  
  def index
    @newbook = Book.new
    @user = User.all
    @users = current_user
  end
  
  
  def show

  end

  def edit
    @users = User.find(:id)
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
