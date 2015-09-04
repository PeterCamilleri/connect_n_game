# coding: utf-8
#\CLI extensions to the \Rack class.

module ConnectNGame

  #The output conversion hash
  CLI_MAP = { nil => ' ', 1 => 'X', 2 => 'O'}

  class Rack

    #Display the rack via a command line interface.
    def cli_display
      #Show the title line.
      puts " " + channel_names.join(" ")

      #Show the body
      (1..depth).reverse_each do |row|
        (1..width).each do |channel|
          print "|#{CLI_MAP[get_cell(channel,row)]}"
        end

        puts "|"
      end
    end

    puts
  end


end
