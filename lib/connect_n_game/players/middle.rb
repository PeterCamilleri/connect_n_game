# coding: utf-8

module ConnectNGame

  #The Middle bot prefers to play the middle.
  class MiddleMoves < Player

    #Build the player
    def initialize(name = "Middle")
      super(name, "Moves toward the middle", :silicon)
    end

    #Make a move. This bot prefers to play the middle.
    #<br>Parameters
    #* game - the game being played.
    #* _piece - the piece to be played, 1 or 2. (Not used here)
    #<br>Returns
    #* A move, 1 .. rack.width
    def make_move(game, _piece)
      weights = game.rack.weights.each_with_index.to_a

      weights.sort.reverse_each do |weight, index|
        channel = index + 1
        return channel unless game.rack.channel_full?(channel)
      end
    end

    #The thrill of victory.
    def winners_comments
      "#{name} says 'Slow and steady wins the race!'"
    end

    #The agony of defeat
    def losers_comments
      "#{name} says 'I lost to the lunatic fringe!'"
    end

  end

  Player.players << MiddleMoves.new
end
