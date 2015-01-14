class AddBoughtStocksToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :bought_stocks, :array, :default => Array.new
  end
end
