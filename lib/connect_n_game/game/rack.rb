# coding: utf-8

#* player.rb - The abstract Player class of the connect_n_game.
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
    #* order - The order of the game, that is the winning number in a row.
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
      return nil unless (1..width).include?(channel)

      rack[channel-1]
    end

    #Is the selected channel full?
    #<br>Parameters
    #* channel - The channel number 1 .. width
    #<br>Returns
    #* true if full (or invalid) else false.
    def channel_full?(channel)
      return true unless (1..width).include?(channel)

      rack[channel-1].length >= depth
    end

  end

end