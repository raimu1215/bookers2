class BooksController < ApplicationController
  def new
  end

  def index
    @newbook = Book.new
    @books = Book.all
    @post_image = new
    @book = Book.find(params[:id])
    @user = User.new
  end

  def show
    @newbook = Book.new
    @books = Book.all
    @book = Book.find(params[:id])
    @user = User.new
  end

  def edit
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    else
      render :index
    end  
    
  end
  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
