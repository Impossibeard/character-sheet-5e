class HeroClass < ApplicationRecord


  def proficiency_bonus
    (level/5).round + 2
  end
end
