class SearchController < ApplicationController
  def filter
    query = params.values_at(:name, :genres, :authors, :publisher).join(' ')
    @results = PgSearch.multisearch(query)
    render json: @results, status: :ok
  end
end
