class AddAddressToEmployee < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :address, :text
  end
end
