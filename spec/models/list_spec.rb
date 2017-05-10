require 'rails_helper'

RSpec.describe List, type: :model do
  subject(:list) { create(:list) }

  it { is_expected.to be_present }
  it { is_expected.to respond_to(:name) }
end
