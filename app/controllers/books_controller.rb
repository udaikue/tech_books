# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.order(:id)
  end

  def show
    @book = Book.find(params[:id])
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
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    redirect_to books_path, notice: "#{book.title} has been successfully updated!"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "#{book.title} has been successfully deleted٩( 'ω' )و"
  end

  private

  def book_params
    params.require(:book).permit(:title, :memo, :paper)
  end
end
