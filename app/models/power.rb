class Power < ApplicationRecord
  has_many :heroines

  def self.powers
    self.all.map do |power|
      power.id
    end
  end
end
