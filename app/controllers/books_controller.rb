class BooksController < ApplicationController
  def new
  end

  def index
    @newbook = Book.new
    @books = Book.all
    @user = User.all
    @users = current_user
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @users = current_user
  end

  def edit
    @newbook = Book.new
    
    @users = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:update] = 'You have updated book successfully.'
    redirect_to book_path(@book.id)
  end
    
    def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    end
    
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id, :Profile_image, :commit)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
 
end
