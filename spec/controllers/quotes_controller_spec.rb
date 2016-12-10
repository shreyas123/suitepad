require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  render_views

  describe 'GET index' do
    subject(:request) { get :index }

    it { is_expected.to be_success }
  end
end
