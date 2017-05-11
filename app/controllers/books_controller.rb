class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books, status: :ok
  end

  def prime
    @books = Book.prime_length_name_books
    render json: @books, status: :ok
  end
end
