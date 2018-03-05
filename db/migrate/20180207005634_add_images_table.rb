class AddImagesTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :project_id
      t.attachment :image
      t.timestamps
    end
  end
end
