# coding: utf-8

module ConnectNGame

  #The abstract Player class of the connect_n_game.
  #<br>Responsibility
  #* This abstract class is responsible for specifying the shared behavior of
  #  all the sorts of players, both human and automaton. This is where moves
  #  are generated and victory celebrated and defeated mourned.
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
    def initialize(name, description, type)
       fail "Invalid type #{type}" unless [:carbon, :silicon].include?(type)
       @name, @description, @type = name, description, type
    end

    #Do the common game preparation.
    def game_initialize
    end

    #The thrill of victory.
    def winners_comments
      "#{name} says 'It was pure skill!'"
    end

    #The agony of defeat
    def losers_comments
      "#{name} says 'No comment.'"
    end

  end

end

require_relative 'human'

#Load up the players!
Dir[File.dirname(__FILE__) + '/players/*.rb'].each {|file| require file }

#Sort them
ConnectNGame::Player.players.sort! {|a,b| a.name.casecmp(b.name) }
