class SessionsController < ApplicationController
    
def create
  @user = User.new(user_params)
  @user.save
  flash[:notice] = 'Welcome! You have signed up successfully.'
    redirect_to books_path
end

def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:notice] = "Signed out successfully."
    redirect_to :root
end
    
    private
  def user_params
    params.require(:user).permit(:name, :email, :password, :profile_image, :introduction)
  end
    
end
