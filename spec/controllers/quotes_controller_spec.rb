require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  render_views

  describe 'GET index' do
    let!(:quote) { create :quote }
    subject(:request) { get :index }

    it { is_expected.to be_success }

    it 'assigns @quote' do
      request
      expect(assigns(:quote)).to eql quote
    end
  end
end
