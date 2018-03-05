class AddLinkColumnToProjectsTable < ActiveRecord::Migration
  def change
    add_column :projects, :link_to_sample, :string
    add_column :projects, :budget, :decimal
  end
end
