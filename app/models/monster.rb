class Monster < Character

    def determine_monster_attack(name)
      case name
      when "Dairy Destroyer"
        #monster's attack is a random number plus their level
        @attack = rand(5) + @level
      when "Bread Burglar"
        @attack = rand(10)
      when "Meat Mangler"
        @attack = rand(15)
      when "Pasta Puncher"
        @attack = rand(20)
      when "Cheese Cutter"
        @attack = rand(25)
      when "Fruit Flattener"
        @attack = rand(30)
      when "Vegetable Violencer"
        @attack = rand(35)
      else
        @attack = 0
      end

    end
end
