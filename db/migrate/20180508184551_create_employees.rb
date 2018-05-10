class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :lastname
      t.string :dni
      t.integer :age
      t.string :role
      t.datetime :birthday
      
      t.timestamps
    end
  end
end
