# coding: utf-8

#Some monkey patching for debugging.
class Array

  #A debugging routine. Turned on by the --debug option.
  def show_weights(msg = "")
    if $game_debug
      print msg
      self.each do |weight|
        print " #{Utl.channel_to_name(weight[1])}#{"%4.1f" % weight[0]}"
      end

      puts
    end

    self
  end

end
