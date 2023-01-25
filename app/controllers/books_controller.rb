class BooksController < ApplicationController
  before_action :correct_user, only: [:edit]
  
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
    # user_id = params[:id].to_i
  # unless user_id == current_user.id
    # redirect_to books_path
  # end
    @book = Book.find(params[:id])
    @users = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @users = current_user
      render :index
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
    
    def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    end
    
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id, :Profile_image)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def correct_user
     @book = Book.find(params[:id])
     @user = @book.user
     redirect_to(books_path) unless @user == current_user
  end
 
end
