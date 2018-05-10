class AddInitialRoles < ActiveRecord::Migration[5.1]
  def up
  	Role.create(name: "Junior")
  	Role.create(name: "Developer")
  	Role.create(name: "Semi-Senior")
  	Role.create(name: "Senior")
  end
  def down
  	Role.delete_all
  end
end
