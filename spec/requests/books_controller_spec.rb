require 'rails_helper'

RSpec.describe BooksController, type: :request do
  let(:amount) { 10 }

  describe 'GET /books' do
    let!(:books) { create_list(:book, amount) }

    before { get '/books' }

    it 'populates an array of books in json' do
      expect(json.size).to eq amount
    end

    it 'returns 200 status' do
      expect(response).to be_success
    end
  end

  describe 'GET /books/prime' do
    let(:amount) { 3 }
    let!(:prime_books) { create_list(:prime_book, amount) }

    before { get '/books/prime' }

    it 'populates an array of `prime` books in json' do
      expect(json.size).to eq amount
    end

    it 'returns 200 status' do
      expect(response).to be_success
    end
  end
end
