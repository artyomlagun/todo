class Project < ActiveRecord::Base
  validates :title, :description, :short_desc, presence: true
  validates :title, uniqueness: true
end
