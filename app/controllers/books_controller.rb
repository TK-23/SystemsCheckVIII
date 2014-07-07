class BooksController < ApplicationController

  def index
    @books = Book.all
  end

 def show
    @book = Book.find(params[:id])
    @review = Review.new()
  end

  def new
    @book = Book.new
  end

  def create

    new_book = book_params

    if book_params["category"]
      category_query = Category.where( name: book_params["category"] )
      if category_query.length == 0
        category = Category.create( name: book_params["category"] )
      else
        category = category_query.first
      end
      new_book["category"] = category
    end

    if !book_params["author"].empty?
      author_query = Author.where( name: book_params["author"] )
      if author_query.length == 0
        author = Author.create( name: book_params["author"] )
      else
        author = author_query.first
      end
      new_book["author"] = author
    else
      new_book.delete "author"
      new_book["author_id"] = ""
    end

    @book = Book.new(new_book)

    if @book.save
      flash[:notice] = "Save Successful"
      redirect_to books_path
    else
      flash.now[:notice] = "Save Failed"
      render :new
    end
  end

  private

  def book_params
    params.required(:book).permit( :title, :author, :category, :year, :description )
  end
end
