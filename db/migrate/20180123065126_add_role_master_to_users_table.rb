class AddRoleMasterToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :role_master, :boolean, default: false
  end
end
