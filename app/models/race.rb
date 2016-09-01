class Race < ApplicationRecord

  enum size: [:tiny, :small, :medium, :large, :huge, :gargantuan]

end
