class AddStockPriceToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :stock_price, :float
  end
end
