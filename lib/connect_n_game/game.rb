# coding: utf-8

require_relative 'game/rack.rb'

#* game.rb - The Game class of the connect_n_game.
module ConnectNGame

  #The Game class of the connect_n_game.
  #<br>Responsibility
  #* This class is responsible for the overall operation of the game. It holds
  #  the playing "rack", and the players. It also keeps a log of moves,
  #  determines if the game has been won or if a stalemate has occurred.
  #<br>Notes
  #* The Game class does NOT interact with the outside world. That is the
  #  job of the UI object.
  class Game

    #The game playing surface
    attr_reader :rack

    #Create an instance of a game object.
    #<br>Parameters
    #* player_ex - The player who moves first
    #* payer_oh - The player who moves next
    #* game_ui - The user interface of the game.
    #* game_size - The size of the game connection (4..8). Default: 4
    #<br>Returns
    #* An instance of a Game.
    def initialize(player_ex, player_oh, game_ui, game_size=4)
      @rack = Rack.new(game_size)

      #WIP
    end

  end

end
