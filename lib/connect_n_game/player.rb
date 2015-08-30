# coding: utf-8

module ConnectNGame

  #The abstract Player class of the connect_n_game.
  #<br>Responsibility
  #* This abstract class is responsible for specifying the shared behavior of
  #  all the sorts of players, both human and automaton. This is where moves
  #  are generated and victory celebrated and defeated mourned.
  class Player

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

  end

end
