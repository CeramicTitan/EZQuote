class Project < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  belongs_to :user
  validates :project_name, presence: true
  validates :project_description, presence: true
  validates :budget, presence: true
end