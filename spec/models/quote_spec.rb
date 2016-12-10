require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:quote) }
    it { is_expected.to validate_presence_of(:author) }
  end
end
