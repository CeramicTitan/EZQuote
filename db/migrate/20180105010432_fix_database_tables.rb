class FixDatabaseTables < ActiveRecord::Migration
  def change
    remove_column :users, :project_name
    remove_column :users, :project_description
    remove_column :users, :user_id
    create_table :projects, force: true do |t|
      t.string   "project_name"
      t.string   "project_description"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
