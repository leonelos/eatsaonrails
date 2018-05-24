class AddRolesToUser < ActiveRecord::Migration[5.1]
  #rails g migration AddUserToUploads user:references
  def change
    add_reference :users, :role, foreign_key: true
  end
end
