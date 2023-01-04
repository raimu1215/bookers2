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
    book = Book.new(book_params)
    book.save
    # 4. トップ画面へリダイレクト
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    else
      render :index
    end  
    
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
