class RemoveRoleFromEmployee < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :role, :string
  end
end
