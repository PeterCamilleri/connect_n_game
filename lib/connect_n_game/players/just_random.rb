# coding: utf-8

module ConnectNGame

  #The JustRandom player simply make random moves.
  class JustRandom < Player

    #Build the player
    def initialize(name = "Random")
      super(name, "Moves randomly.", :silicon)
    end

    #Make a move. This bot moves randomly.
    #<br>Parameters
    #* game - the game being played.
    #* _piece - the piece to be played, 1 or 2. (Not used here)
    #<br>Returns
    #* A move, 1 .. rack.width
    def make_move(game, _piece)
      begin
        channel = rand(1..(game.rack.width))
      end while game.rack.channel_full?(channel)

      channel
    end

  end

  Player.players << JustRandom.new
end
