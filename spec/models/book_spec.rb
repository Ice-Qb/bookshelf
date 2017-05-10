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

  it 'has the name which length is not a prime number' do
    expect(book.name_length_prime?).to be false
  end

  context "when book's name is a prime number" do
    let(:book) { create(:book, name: 'Faust') }

    it 'understands that' do
      expect(book.name_length_prime?).to be true
    end
  end
end
