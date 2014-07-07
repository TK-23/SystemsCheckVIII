class BooksController < ApplicationController

  def index
    @books = Book.all
  end

 def show
    @book = Book.find(params[:id])
  end


  def new
    @book = Book.new
  end

  def create

    category_query = Category.where( name: book_params["category"] )
    if category_query.length == 0
      category = Category.create( name: book_params["category"] )
    else
      category = category_query.first
    end

    author_query = Author.where( name: book_params["author"] )
    if author_query.length == 0
      author = Author.create( name: book_params["author"] )
    else
      author = author_query.first
    end

    new_book = book_params
    new_book ["category"] = category
    new_book ["author"] = author

    book = Book.new(new_book)

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
