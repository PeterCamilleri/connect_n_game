# coding: utf-8

module ConnectNGame

  #The JustRandom player simply make random moves.
  class Human < Player

    #Build the player
    def initialize(name = "Human")
      super(name, "An actual player.", :carbon)
    end

  end

  Player.players << Human.new("Bruce")
  Player.players << Human.new("Sheila")
end
