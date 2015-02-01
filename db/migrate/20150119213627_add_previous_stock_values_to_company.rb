class AddPreviousStockValuesToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :previous_stock_values, :array, :default => Array.new
  end
end
