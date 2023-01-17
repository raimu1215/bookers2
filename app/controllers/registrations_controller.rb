class RegistrationsController < ApplicationController
    
def create
  @user = User.new(user_params)
  if @user.save
    redirect_to books_path, notice: 'Welcome! You have signed up successfully.' 
  else
    render :new
  end
end

private
  def user_params
    params.require(:user).permit(:name, :email, :passwords)
  end
    
end
