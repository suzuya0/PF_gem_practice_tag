class BooksController < ApplicationController
  
  def index
    if params[:tag_name]
      @book = Book.new
      @books = Book.tagged_with("#{params[:tag_name]}")
    else
      @book = Book.new
      @books = Book.all
    end
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end
  
  def book_params
    params.require(:book).permit(:title, :content, :tag_list)
  end
  
end
