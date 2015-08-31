# coding: utf-8

module ConnectNGame

  #The JustRandom player simply make random moves.
  class JustRandom < Player

    #Build the player
    def initialize(name = "Random")
      super(name, "Moves randomly.", :silicon)
    end

  end

  Player.players << JustRandom.new
end
