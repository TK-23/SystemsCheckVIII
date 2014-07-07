class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)

    if book.save
      flash[:notice] = "Save Successful"
      redirect_to books_path
    else
      flash[:notice] = "Save Failed"
      render :new
    end
  end

  private

  def book_params
    params.required(:book).permit( :id, :title, :author, :category, :year, :description )
  end
end
