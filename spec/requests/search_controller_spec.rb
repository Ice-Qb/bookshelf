require 'rails_helper'

RSpec.describe SearchController, type: :request do
  describe 'GET /search/filter' do
    let(:faust) { 'Faust' }
    let!(:book) { create(:prime_book, available: true) }
    let!(:faust_article) { create(:article, name: "About #{faust}") }

    before { get "/search/filter?name=#{faust}" }

    it 'finds requested records in json' do
      expect(json.size).to eq 2
    end

    it 'returns 200 status' do
      expect(response).to be_success
    end

    context 'when multiple parameters are present' do
      let(:author) { 'Bob' }
      let!(:article) { create(:article, authors: author) }

      before { get "/search/filter?name=Master&authors=#{author}" }

      it 'finds requested records in json' do
        expect(json.size).to eq 1
      end
    end
  end
end
