class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true
  validates :power_id, inclusion: {in: Power.powers}

end
