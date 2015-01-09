class StockmarketController < ApplicationController
  def index
    @companies = Company.all
  end
end
