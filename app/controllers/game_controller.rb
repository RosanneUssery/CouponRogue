class GameController < ApplicationController
MAX_PLAYER_HITPOINTS = 100
MAX_COUPONS_REDEEMED = 100

    def initialize
      @coupons_redeemed = 0
      start_game
    end

    def start_game
      while true
        puts "You have redeemed #{@coupons_redeemed} coupons."
        @steps_taken += 1
      end
    end
  end

  Game.new


end
