# coding: utf-8

module ConnectNGame

  #The EchoMoves echoes moves when possible.
  class PaltryImprovement < Player

    #Build the player
    def initialize(name = "Paltry")
      super(name, "Tactical analysis with a minor improvement.", :silicon)
    end

    #Make a move. This bot picks the move with the highest score.
    #<br>Parameters
    #* game - the game being played.
    #* piece - the piece to be played, 1 or 2.
    #<br>Returns
    #* A move, 1 .. rack.width
    def make_move(game, piece)
      #Compute the moves of the first ply.
      first_ply = (game.rack.weights.each_with_index.map do |weight, index|
        channel = index + 1
        [weight + game.rack.score_move(channel, piece), channel]
      end).sort.show_weights("+|")

      #If we're done, stop.
      return first_ply.last[1] if first_ply.last[0] >= game.rack.order

      #Factor in the behavior of the opponent.
      (0...(first_ply.length)).each do |index|
        copy = game.rack.clone.deep_clone

        copy.rack[first_ply[index][1]-1] << piece
        first_ply[index][0] -= check_opponent(copy, (piece % 2) + 1)
      end

      first_ply.sort.show_weights("-|").last[1]
    end

    #Check for the opponent's best moves at this level
    def check_opponent(rack, piece)
      result = 0

      (1..rack.width).each do |channel|
        score = rack.score_move(channel, piece)
        result = score if result < score
      end

      result
    end

    #The thrill of victory.
    def winners_comments
      "#{name} says 'Good moves must give way to better!'"
    end

    #The agony of defeat
    def losers_comments
      "#{name} says 'How could I have missed this?'"
    end

  end

  Player.players << PaltryImprovement.new
end
