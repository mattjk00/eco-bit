class AddBoughtStocksToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :bought_stocks, :array
  end
end
