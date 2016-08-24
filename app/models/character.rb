class Character < ApplicationRecord
  has_one :race
  has_one :hero_class

  enum vision: [:normal, :darkvision, :superior_darkvision, :truesight, :blind]

end
