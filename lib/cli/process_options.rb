# coding: utf-8
# Handle any command line arguments.

require 'getoptlong'

module ConnectNGame

  class CLI

    #Handle any command line parameters.
    def process_cmd_line

      opts = GetoptLong.new(
        [ "--help",   "-h", "-?", GetoptLong::NO_ARGUMENT ],
        [ "--player", "-p",       GetoptLong::REQUIRED_ARGUMENT ],
        [ "--order",  "-o",       GetoptLong::REQUIRED_ARGUMENT ],
        [ "--debug",  "-d",       GetoptLong::NO_ARGUMENT ])

      # Translate the parsed options into fOOrth.
      opts.each do |opt, arg|

        case opt
        when "--player"
          fail "Error: Too many players!" if @players.length >= 2

          puts "Player ##{@players.length + 1} is #{arg}"
          fail "Error: Unknown player: #{arg}" unless (player = find_player(arg))
          @players << player
        when "--order"
          @order = arg.to_i
          fail "Invalid order #{arg}" unless @order.between?(4,8)
        when "--debug"
          puts "Debug mode is enabled."
          $game_debug = true
        else
          fail ""
        end
      end

    rescue => err
      puts err.message
      show_help
      exit
    end

    #Display the help message.
    def show_help
      puts
      puts "Usage info: connect_n_game <options>"
      puts
      puts "--help, -h, -?      -- Display this message and quit."
      puts "--player, -p <name> -- Select player or automaton 'name'"
      puts "                       Note: Limit of two players"
      puts "--order, -o <4..8>  -- The winning run length. Default=4"
      puts "--debug, -d         -- Display debug info."

      show_players
    end

  end

end
