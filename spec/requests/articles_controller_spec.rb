require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
  let(:amount) { 10 }

  describe 'GET /articles' do
    let!(:articles) { create_list(:article, amount) }

    before { get '/articles' }

    it 'populates an array of articles in json' do
      expect(json.size).to eq amount
    end

    it 'returns 200 status' do
      expect(response).to be_success
    end
  end
end
