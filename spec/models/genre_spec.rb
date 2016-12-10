require 'rails_helper'

RSpec.describe Genre, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:genre_type) }
    it { is_expected.to validate_uniqueness_of(:genre_type).case_insensitive }
  end
end
