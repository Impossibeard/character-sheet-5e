class Race < ApplicationRecord

  enum size: [:tiny, :small, :medium, :large, :huge, :gargantuan]

  enum vision: [:normal, :darkvision, :superior_darkvision, :truesight, :blind]

end
