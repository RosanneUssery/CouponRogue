class Monster < ApplicationRecord

  def determine_monster_attack
    @attack = rand(@attack) + @level
  end

  # Dairy Destroyer, Bread Burglar, Meat Mangler, Pasta Puncher, Cheese Cutter, Fruit Flattener, Vegetable Violencer
  # Tortilla Thief, Candy Crook, Frozen Filcher, Refried Robber, Pizza Prowler

  # is it better to do it this way or to
    def determine_monster_attack(name)
      case name
      when "Dairy Destroyer"
        #monster's attack is a random number plus their level
        @attack = rand(5) + @level
      when "Bread Burglar"
        @attack = rand(10) + @level
      when "Meat Mangler"
        @attack = rand(15) + @level
      when "Pasta Puncher"
        @attack = rand(20) + @level
      when "Cheese Cutter"
        @attack = rand(25) + @level
      when "Fruit Flattener"
        @attack = rand(30) + @level
      when "Vegetable Violencer"
        @attack = rand(35) + @level
      else
        @attack = 0
      end

    end
end
