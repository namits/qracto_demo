class ProjectDetail < ApplicationRecord
  validates_presence_of :name, :contact_no, :email, :country, :description
  validates :contact_no, numericality: { equal_to: 100,  only_integer: true }
end
