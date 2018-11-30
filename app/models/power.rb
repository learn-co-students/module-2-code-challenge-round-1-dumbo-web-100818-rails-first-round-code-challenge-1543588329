class Power < ApplicationRecord
  has_many :heroines
  validates :name, :description, uniqueness: true, presence: true
end
