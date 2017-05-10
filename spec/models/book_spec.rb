require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { create(:book) }

  it { is_expected.to be_present }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:available) }
  it { is_expected.to respond_to(:genres) }
  it { is_expected.to respond_to(:authors) }
  it { is_expected.to respond_to(:publisher) }
  it { is_expected.to respond_to(:lists) }

  context 'for methods related to prime numbers' do
    let!(:faust_book) { create(:book, name: 'Faust') }

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
end
