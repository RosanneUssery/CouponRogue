class GameController < ApplicationController
  STARTING_PLAYER_HITPOINTS = 100
  MAX_COUPONS_REDEEMED = 100

  # playing a character with a game id = game id + character id = state of that character
  # that way the game doesn't get overridden/weird state with multiple players
    def index
      # @character = Character.new
      puts "wheeeee!"
      start_game
    end

    def start_game
      while true
        #do something
        # assign game id to unique session somehow
      end
    end

    def game_over
      puts "Game Over! Whomp whomp"
      exit
    end

  GameController.new
end
