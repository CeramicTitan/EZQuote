class CreateChecklistsTable < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.integer :project_id
      t.timestamps
    end
  end
end
