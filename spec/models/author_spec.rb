require 'rails_helper'

RSpec.describe Author, type: :model do

  describe 'associations' do
    it { is_expected.to have_many(:quotes).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
