class UsersController < ApplicationController
  
  def index
  @users = User.all
  profile_image = User.find(1)
  profile_image.get_profile_image
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
