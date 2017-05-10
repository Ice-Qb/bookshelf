require 'rails_helper'

RSpec.describe Article, type: :model do
  subject(:article) { create(:article) }

  it { is_expected.to be_present }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:body) }
  it { is_expected.to respond_to(:genres) }
  it { is_expected.to respond_to(:authors) }
end
