class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.float :money, :default => 1000
      t.integer :employees, :default => 0

      t.timestamps null: false
    end
  end
end
