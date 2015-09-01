# coding: utf-8

module ConnectNGame

  #The class of game racks. That is a matrix of cells
  class Rack

    #The number in a row needed for victory.
    attr_reader :order

    #The depth of the playable area.
    attr_reader :depth

    #The width of the playable area.
    attr_reader :width

    #The raw playable area.
    attr_reader :rack

    #Create a rack of the appropriate order.
    #<br>Parameters
    #* order - The order of the game, that is the winning
    #  number of pieces in a row.
    def initialize(order)
      unless (4..8).include?(order)
        fail "Invalid game dimension #{order} not (4 .. 8)"
      end

      @order = order
      @depth = @order + (order >> 1)
      @width = @depth + (@depth.odd? ? 2 : 1)

      @rack = Array.new(@width) { [ ] }
    end

    #Get the required play channel
    #<br>Parameters
    #* channel - The channel number 1 .. width
    #<br>Returns
    #* The requested channel (array) or nil for invalid channels.
    def get_channel(channel)
      rack[channel-1]
    end

    #Is the selected channel full?
    #<br>Parameters
    #* channel - The channel number 1 .. width
    #<br>Returns
    #* true if full else false.
    def channel_full?(channel)
      rack[channel-1].length >= depth
    end

    #Is the rack full?
    #<br>Returns
    #* true if full (or invalid) else false.
    def rack_full?
      rack.each do |channel|
        return false if channel.length < depth
      end

      true
    end

    #Get the specified cell.
    #<br>Parameters
    #* channel - The channel number 1 .. width
    #* row - The row number 1 .. depth
    #<br>Returns
    #* The contents of the cell or nil
    def get_cell(channel, row)
      return nil unless valid_channel?(channel)
      return nil unless valid_row?(row)

      rack[channel-1][row-1]
    end

    #Play a specified channel.
    #<br>Parameters
    #* channel - The channel number 1 .. width
    #* piece - The piece to be played.
    #<br>Returns
    #* The score of the move or raises \GameInvalidMove exception.
    def play_channel(channel, piece)
      if channel_full?(channel)
        fail GameInvalidMove, "Channel #{channel} is full"
      end

      score = score_move(channel, piece)
      rack[channel-1] << piece
      score
    end

    #Determine the score obtained for moving to a specified channel
    #<br>Parameters
    #* channel - The channel number 1 .. width
    #* piece - The piece to be played.
    #<br>Returns
    #* The score for that play 0 .. n
    def score_move(channel, piece)
      return 0 if channel_full?(channel)

      row = channel_to_row(channel)

      ([[0,1], [1,1], [1,0], [1,-1]].map do |delta|
        dx, dy = delta
        count_pieces(channel, row,  dx,  dy, piece) + 1 +
        count_pieces(channel, row, -dx, -dy, piece)
      end).max
    end

    #Count the pieces along the designated path.
    #<br>Parameters
    #* channel - The starting channel
    #* row - The starting row
    #* dx - The channel step value
    #* dy - The row step value
    #* piece - The piece we are looking for.
    #<br>Returns
    #* The score for that play 0 .. n
    def count_pieces(channel, row, dx, dy, piece)
      result = 0

      while result < width
        channel, row = channel+dx, row+dy

        return result unless piece == get_cell(channel, row)

        result += 1
      end

      fail "Looping error"
    end

    #Get the free row for the specified channel.
    #<br>Parameters
    #* channel - The channel number 1 .. width
    #<br>Returns
    #* The row number or nil.
    def channel_to_row(channel)
      channel_full?(channel) ? nil : rack[channel-1].length + 1
    end

    #Is this a valid channel?
    def valid_channel?(channel)
      (1..width).include?(channel)
    end

    #Is this a valid row?
    def valid_row?(row)
      (1..depth).include?(row)
    end
  end

end