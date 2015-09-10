# coding: utf-8

module ConnectNGame

  #The EchoMoves echoes moves when possible.
  class BasicMoves < Player

    #Build the player
    def initialize(name = "Basic")
      super(name, "Minimum tactical analysis.", :silicon)
    end

    #Make a move. This bot picks the move with the highest score.
    #<br>Parameters
    #* game - the game being played.
    #* piece - the piece to be played, 1 or 2.
    #<br>Returns
    #* A move, 1 .. rack.width
    def make_move(game, piece)
      (game.rack.weights.each_with_index.map do |weight, index|
        channel = index + 1
        [weight + game.rack.score_move(channel, piece), channel]
      end).sort.show_weights("A+=").last[1]
    end

    #The thrill of victory.
    def winners_comments
      "#{name} says 'A genius in my own mind!'"
    end

    #The agony of defeat
    def losers_comments
      "#{name} says 'Hmmm... What did I miss?'"
    end

  end

  Player.players << BasicMoves.new
end
