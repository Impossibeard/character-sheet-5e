class Armor < ApplicationRecord
  has_many :equipped_items
  has_many :characters, :through => :equipped_items

  def armor_base(dex_mod)
    if dex_mod > 2
      capped_modifier = 2
    else
      capped_modifier = dex_mod
    end

    case armor_type
    when "Light"
        ac = armor_base + capped_modifier
      when "Medium"
        ac = armor_base + capped_modifier
      when "Heavy"
        ac = armor_base
      when "Shield"
        ac = armor_base
      else
        nil
    end
    return ac
  end
end
