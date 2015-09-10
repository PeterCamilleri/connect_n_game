# coding: utf-8
#\CLI extensions to the \Human class.

module ConnectNGame

  class Human < Player

    #Make a move. This player moves with DNA and other stuff too.
    #<br>Parameters
    #* game - the game being played.
    #* piece - the piece to be played, 1 or 2.
    #<br>Returns
    #* A move, 1 .. rack.width
    def make_move(game, piece)
      begin
        legal = legal_moves(game.rack)
        puts "Player #{piece} select [#{legal}] "
        reply = gets[0].upcase
        channel = Utl.name_to_channel(reply)
      end until channel && legal.include?(reply)

      channel
    end

    #Get a string of legal moves.
    #<br>Parameters
    #* rack - the playing area.
    #<br>Returns
    #* A string with all possible legal moves.
    def legal_moves(rack)
      legal = rack.channel_names.reject do |name|
        channel = Utl.name_to_channel(name)
        rack.channel_full?(channel)
      end

      legal.join("")
    end

  end

end
