class AddPasswordAndPasswordConfirmationToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :password, :string
    add_column :companies, :password_confirmation, :string
  end
end
