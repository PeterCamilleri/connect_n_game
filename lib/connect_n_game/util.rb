# coding: utf-8

#A small utility module
module Utl
  #An array with some letters in it and a place holder at zero.
  Letters = %w(x A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

  #Convert a channel name to its number.
  #<br>Parameters
  #* letter - the letter that was played.
  #<br>Returns
  #* The channel number (1..26) or nil if invalid.
  def self.name_to_channel(letter)
    Letters.find_index(letter[0].upcase)
  end

  #Convert a channel number to its name.
  #<br>Parameters
  #* channel - the channel number (1..26),
  #<br>Returns
  #* The channel letter.
  def self.channel_to_name(channel)
    Letters[channel]
  end

end
