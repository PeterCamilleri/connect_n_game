# coding: utf-8

module ConnectNGame

  #The EchoMoves echoes moves when possible.
  class EchoMoves < Player

    #Build the player
    def initialize(name = "Echo")
      super(name, "Really unoriginal.", :silicon)
    end

    #Make a move. This is dummy code for testing.
    #<br>Parameters
    #* game - the game being played.
    #* _piece - the piece to be played, 1 or 2. (Not used here)
    #<br>Returns
    #* A move, 1 .. rack.width
    def make_move(game, _piece)
      channel = game.log[-1]

      unless channel && !game.rack.channel_full?(channel)
        begin
          channel = rand(1..(game.rack.width))
        end while game.rack.channel_full?(channel)
      end

      channel
    end

    #The thrill of victory.
    def winners_comments
      "#{name} says 'When did I pass you?'"
    end

    #The agony of defeat
    def losers_comments
      "#{name} says 'Yes! I won silver!'"
    end

  end

  Player.players << EchoMoves.new
end
