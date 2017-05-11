class ListsController < ApplicationController
  def top_discount_books
    @results = Book.top_discount_books(params[:top] || 5)
    render json: @results, status: :ok
  end
end
