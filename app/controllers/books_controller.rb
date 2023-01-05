class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
    @post_image = new
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def edit
  end
  
  def create
    # 4. トップ画面へリダイレクト
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
