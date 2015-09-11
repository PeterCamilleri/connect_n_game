# coding: utf-8

require_relative 'game/rack.rb'

module ConnectNGame

  #The \Game class of the connect_n_game.
  #<br>Responsibility
  #* This class is responsible for the overall operation of the game. It holds
  #  the playing "rack", and the players. It also keeps a log of moves,
  #  determines if the game has been won or if a stalemate has occurred.
  #<br>Notes
  #* The \Game class does NOT interact with the outside world. That is the
  #  job of the UI object.
  class Game

    #The \game playing surface
    attr_reader :rack

    #The user interface
    attr_reader :ui

    #Whose playing?
    attr_reader :players

    #The play log
    attr_reader :log

    #The current player
    attr_reader :current

    #The last played turn number.
    attr_reader :turn

    #Create an instance of a \game object.
    #<br>Parameters
    #* player_ex - The player who moves first
    #* payer_oh - The player who moves next
    #* game_size - The size of the game connection (4..8). Default: 4
    #<br>Returns
    #* An instance of a \Game.
    def initialize(player_ex, player_oh, game_size=4)
      @game_size = game_size
      #Set up player related data.
      @players = { 1 => player_ex, 2 => player_oh }
    end

    #What player moves next?
    #<br>Returns
    #* An instance of a \Player.
    def current_player
      players[current]
    end

    def previous_player
      players[(@current % 2) + 1]
    end

    #Get ready to start a game
    def game_initialize
      #Set up game play data.
      @turn = 0
      @current = 1
      @rack = Rack.new(@game_size)
      @log  = []

      self
    end

    #Play the next move!
    #<br>Returns
    #* :victory, :stalemate, :continue, or :invalid_move
    def next_move
      channel = current_player.make_move(self, current)
      score = rack.play_channel(channel, current)
      @log << channel
      @turn += 1

      if score >= rack.order
        :victory
      elsif rack.rack_full?
        :stalemate
      else
        @current = (@current % 2) + 1
        :continue
      end
    end

    #What was the last move?
    def last_move
      log[-1]
    end

  end

end
