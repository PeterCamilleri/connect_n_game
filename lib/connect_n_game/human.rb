# coding: utf-8

module ConnectNGame

  #The Human player simply makes carbon based moves.
  class Human < Player

    #Build the player
    def initialize(name = "Human")
      super(name, "An actual player.", :carbon)
    end

    #The thrill of victory.
    def winners_comments
      "Congratulations #{name}! You're our winner today!"
    end

    #The agony of defeat
    def losers_comments
      "Too bad #{name}, you lose. Hang your head in shame."
    end

  end

  Player.players << Human.new("Bruce")
  Player.players << Human.new("Sheila")
end
