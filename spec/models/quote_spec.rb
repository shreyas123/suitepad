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

  describe '#genre_type' do
    let(:genre) { create :genre, genre_type: 'happy' }
    let(:quote) { create :quote, genre: genre }

    subject { quote.genre_type }

    context 'when genre exists' do
      it { is_expected.to eql 'happy' }
    end
    context 'when genre does not exists' do
      let(:genre) { nil }

      it { is_expected.to eql 'nature' }
    end
  end
end
