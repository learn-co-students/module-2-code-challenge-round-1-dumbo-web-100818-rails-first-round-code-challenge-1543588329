class Heroine < ApplicationRecord
  belongs_to :power
  validates :power, uniqueness: true


end
