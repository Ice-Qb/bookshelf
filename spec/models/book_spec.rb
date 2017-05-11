require 'rails_helper'

RSpec.describe Book, type: :model do
  subject!(:book) { create(:book) }

  it { is_expected.to be_present }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:available) }
  it { is_expected.to respond_to(:genres) }
  it { is_expected.to respond_to(:authors) }
  it { is_expected.to respond_to(:publisher) }
  it { is_expected.to respond_to(:lists) }

  context 'for methods related to prime numbers' do
    let!(:faust_book) { create(:prime_book) }

    describe '#name_length_prime?' do
      it 'has the name which length is not a prime number' do
        expect(book.name_length_prime?).to be false
      end

      it "understands when book's name is a prime number" do
        expect(faust_book.name_length_prime?).to be true
      end
    end

    describe '.prime_length_name_books' do
      let!(:kolobok_book) { create(:book, name: 'kolobok') }

      it 'returns all the books where their name lengths are the prime '\
         'numbers' do
        expect(described_class.prime_length_name_books).
          to eq [faust_book, kolobok_book]
      end
    end
  end

  context 'for Multisearch option' do
    let(:don) { 'Don Quixote' }

    it 'finds records between Books and Articles with the same part of name,'\
      ' genres, or authors' do
      create(:book, name: don, available: true)
      create(:article, name: "Who was #{don} ?")
      expect(PgSearch.multisearch('Quixote').size).to eq 2
    end

    it 'does not find the book if it is not available' do
      expect(PgSearch.multisearch('The Master')).to be_empty
    end
  end
end
