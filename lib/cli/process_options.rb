# coding: utf-8

# Handle any command line arguments.


require 'getoptlong'


module ConnectNGame

  class CLI

    #Handle any command line parameters.
    def process_cmd_line

      opts = GetoptLong.new(
        [ "--help",   "-h", "-?", GetoptLong::NO_ARGUMENT ],
        [ "--player", "-p",       GetoptLong::REQUIRED_ARGUMENT ])

      # Translate the parsed options into fOOrth.
      opts.each do |opt, arg|

        case opt
        when "--player"
          fail "" if @players.length >= 2

          puts "Player ##{@players.length + 1} is #{arg}"
          fail "" unless (player = find_player(arg))
          @players << player
        else
          fail ""
        end
      end

    rescue
      show_help
      exit
    end

    #Display the help message.
    def show_help

      puts "Usage info: connect_n_game <options>"
      puts
      puts "--help, -h, -?      -- Display this message and quit."
      puts "--player, -p <name> -- Select player or automaton 'name'"
      puts "                       Note: Limit of two players"
      puts
      puts "Supported players: "
      show_players
    end

  end

end
