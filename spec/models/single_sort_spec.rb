require 'rails_helper'

RSpec.describe SingleSort, type: :model do
  subject(:single_sort) { create(:single_sort) }

  it { is_expected.to be_present }
  it { is_expected.to respond_to(:position) }
  it { is_expected.to respond_to(:book) }
  it { is_expected.to respond_to(:list) }
end
