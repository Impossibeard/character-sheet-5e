class Armor < ApplicationRecord
  belongs_to :character

  has_many :equipped_items
  has_many :characters, :through => :equipped_items
end
