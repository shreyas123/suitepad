require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:genre) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:quote) }
    it { is_expected.to validate_presence_of(:author) }
  end

  describe 'scopes' do
    describe '.random' do
      let!(:quote) { create :quote, quote: 'Shreyas' }

      it 'returns any one random quote' do
        expect(described_class.random).to eql quote
      end
    end
  end
end
