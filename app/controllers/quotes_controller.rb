class QuotesController < ApplicationController

  def index
    @quote = Quote.random
  end

  def random_quote
    render json: Quote.random
  end
end
