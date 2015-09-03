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
        channel = name_to_channel(reply)
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
        channel = name_to_channel(name)
        rack.channel_full?(channel)
      end

      legal.join("")
    end

    #Convert a channel name to its number.
    #<br>Parameters
    #* letter - the letter that was played.
    #<br>Returns
    #* The channel number (1..13) or nil if invalid.
    def name_to_channel(letter)
      %w(x A B C D E F G H I J K L M).find_index(letter[0].upcase)
    end

  end

end
