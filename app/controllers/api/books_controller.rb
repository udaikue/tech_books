# frozen_string_literal: true

class API::BooksController < API::BaseController
  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end
