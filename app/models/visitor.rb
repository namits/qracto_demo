class Visitor < ApplicationRecord
  validates_presence_of :name, :mobile_no, :email, :country
  validates :mobile_no, numericality: { equal_to: 100,  only_integer: true }
end
