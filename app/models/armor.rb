class Armor < ApplicationRecord
  has_many :equipped_items
  has_many :characters, :through => :equipped_items
end
