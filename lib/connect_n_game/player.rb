# coding: utf-8

module ConnectNGame

  #The abstract Player class of the connect_n_game.
  #<br>Responsibility
  #* This mostly abstract class is responsible for specifying the shared
  #  behavior of all the sorts of players, both human and automaton. This is
  #  where moves are generated, victory celebrated, and defeat mourned.
  class Player
    #Set up class instance data.
    @players = []

    class << self
      #The list of available players.
      attr_reader :players
    end

    # The name of this player.
    attr_reader :name

    # The description of this player.
    attr_reader :description

    #The type of this player: :carbon or :silicon
    attr_reader :type

    #Do the common player setup
    #<br>Parameters
    #* name - The name of the player.
    #* description - A witty description of the player.
    #* type - :carbon or :silicon
    #<br>Returns
    #* An instance of \Player
    def initialize(name, description, type)
       fail "Invalid type #{type}" unless [:carbon, :silicon].include?(type)
       @name, @description, @type = name, description, type
    end

    #Is this an automaton?
    def silicon?
      type == :silicon
    end

    #Is this an organic life-form?
    def carbon?
      type == :carbon
    end

    #Make a move. This is dummy code for testing.
    #<br>Parameters
    #* _game - the game being played - not used here.
    #* piece - the piece to be played, 1 or 2.
    #<br>Returns
    #* A move, 1 .. rack.width
    def make_move(_game, piece)
      piece
    end

    #The thrill of victory.
    def winners_comments
      "#{name} says 'It was all up to pure skill!'"
    end

    #The agony of defeat
    def losers_comments
      "#{name} says 'No comment.'"
    end

  end

end

require_relative 'human' #Humans come first!!!

#Load up the players!
Dir[File.dirname(__FILE__) + '/players/*.rb'].each {|file| require file }

#Sort them
ConnectNGame::Player.players.sort! {|a,b| a.name.casecmp(b.name) }
