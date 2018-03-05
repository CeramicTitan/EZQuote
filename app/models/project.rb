class Project < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  has_one :checklist 
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :budget, presence: true
  
  def set_status(status)
    self.update_attribute(:status, status.upcase)
  end
end