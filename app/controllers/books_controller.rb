class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save!
    redirect_to books_path, notice: "#{book.title} has been successfully created!"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :memo, :paper)
  end
end