require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { create(:book) }

  it { is_expected.to be_present }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:available) }
  it { is_expected.to respond_to(:genres) }
  it { is_expected.to respond_to(:authors) }
  it { is_expected.to respond_to(:publisher) }
end
