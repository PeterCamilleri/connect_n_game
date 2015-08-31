# coding: utf-8

module ConnectNGame

  #The JustRandom player simply make random moves.
  class JustRandom < Player

    #Build the player
    def initialize
      super("Random", "Make random moves", :silicon)
    end

  end

  Player.players << JustRandom.new
end
