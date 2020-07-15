class GameController < ApplicationController
  STARTING_PLAYER_HITPOINTS = 100
  MAX_COUPONS_REDEEMED = 100

    def initialize
      @character = Character.new
      start_game
    end

    def start_game
      while true
        #do something
      end
    end

    def game_over
      puts "Game Over! Whomp whomp"
      exit
    end

  GameController.new
end
