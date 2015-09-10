# coding: utf-8

#A small utility module
module Utl

  #Convert a channel name to its number.
  #<br>Parameters
  #* letter - the letter that was played.
  #<br>Returns
  #* The channel number (1..13) or nil if invalid.
  def self.name_to_channel(letter)
    %w(x A B C D E F G H I J K L M).find_index(letter[0].upcase)
  end

  #Convert a channel number to its name.
  #<br>Parameters
  #* channel - the channel number (1..13),
  #<br>Returns
  #* The channel letter.
  def self.channel_to_name(channel)
    %w(x A B C D E F G H I J K L M)[channel]
  end

end
