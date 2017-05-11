require 'rails_helper'

RSpec.describe ListsController, type: :request do
  let(:amount) { 10 }

  before do
    discount_list = create(:list, name: 'discount')
    amount.times do
      book = create(:book)
      single_sort = create(
        :single_sort,
        book_id: book.id,
        list_id: discount_list.id,
        position: rand(1..5)
      )
    end
  end

  describe 'GET /lists/books' do
    before { get '/lists/books' }

    it 'return top N (5 by default) books with discount in json' do
      expect(json.size).to eq 5
    end

    it 'returns 200 status' do
      expect(response).to be_success
    end

    context 'when top parameter is present' do
      let(:top) { 7 }

      before { get "/lists/books?top=#{top}" }

      it 'accepts it and returns the list correctly' do
        expect(json.size).to eq top
      end
    end
  end
end
