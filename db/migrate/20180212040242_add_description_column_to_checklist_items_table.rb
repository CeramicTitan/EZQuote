class AddDescriptionColumnToChecklistItemsTable < ActiveRecord::Migration
  def change
    add_column :checklist_items, :description, :string
  end
end
