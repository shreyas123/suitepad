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

  describe 'GET random_quote' do
    let!(:quote) { create :quote }
    subject(:request) { get :random_quote, format: :json }

    it { is_expected.to be_success }

    it 'returns the JSON object of the quote' do
      request
      expect(JSON.parse(response.body)).to eql(JSON.parse(quote.to_json))
    end
  end
end
