class CharacterController < ApplicationController


  def initialize
    @health = Character.health
    @discount = Player.discount
    @experience = Player.experience
    @monster_attack = Monster.attack
  end

  def player_take_damage
    @health -= @monster_attack
    kill_player if @health < 1
  end

  def player_deal_damage
    @damage = rand(@discount)
  end

  def monster_take_damage
    @health -= @damage
    kill_monster if @health < 1
  end

  def kill_monster
    puts "monster is ded, good job!"
    # I have no idea if this will work?
    # But I want to add to their experience for every monster killed.
    # So if they kill a level 1 monster, they get 10 exp,
    # if they kill a level 10 monster, they get 100 exp
    @experience += Monster.level * 10
    if @experience % 100 == 0
      Player.level_up
    end
  end

  def kill_player
    GameController.game_over
  end

end
