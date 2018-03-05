class Checklist < ActiveRecord::Base
  has_many :checklist_items
  belongs_to :project
  
  def get_status
    completed = self.checklist_items.all.where(:complete => true).count.to_f
    total = self.checklist_items.all.count.to_f
    (completed/total)*100.round
  end
  
end