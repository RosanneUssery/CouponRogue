module Api
  module V1
    class CharacterController < ApplicationController
      # I need to look into these and see what they do in particular
      # before_action :authorize_access_request!, except: [:show, :index]
      # the above is how it was in the example, but I feel like I don't want character accessible unless they're logged in
      before_action :authorize_access_request!
      # before_action :set_character, only: [:show, :update, :destroy]

      def index
        #this needs o show the characters that the user has... so this code probably needs work
        @characters = current_user.characters.all

        render json: @characters
      end

      def show
        render json: @character
      end

      def create
        @character = current_user.characters.build(character_params)

        if @character.save
          render json: @character, status: :created
        else
          render json: @character.errors, status: :unprocessable_entity
        end
      end

      def update
        if @character.update(character_params)
          render json: @character
        else
          render json: @character.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @character.destroy
      end

      private
      def set_character
        @character = current_user.characters.find(params[:id])
      end

      def character_params
        params.require(:character).permit(:name)
      end

      # these methods might not go in the controller...
      def player_take_damage
        @health -= Monster.attack
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
  end
end

