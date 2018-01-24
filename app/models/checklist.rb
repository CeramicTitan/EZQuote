class Checklist < ActiveRecord::Base
  has_many :checklist_items
  belongs_to :project
end