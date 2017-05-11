require 'rails_helper'

RSpec.describe BooksController, type: :request do
  let(:amount) { 10 }

  describe 'GET #index' do
    let(:books) { create_list(:book, amount) }

    before { get '/books' }

    it 'populates an array of books in json' do
      expect(json['books'].size).to eq amount
    end

    it 'returns 200 status' do
      expect(response).to be_success
    end
  end
end
