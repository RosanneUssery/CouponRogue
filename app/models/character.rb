class Character < ApplicationRecord
  
  def level_up
    # I want to set this up that the player levels up faster earlier
    # and then as they go, they level more slowly after lvl 10
    if level < 10
      @health += 10
      @discount += 10
      @level += 1
    elsif Character.level >= 10
      Character.health += 5
      @discount += 5
      Character.level += 1
    end
  end
end
