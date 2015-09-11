# coding: utf-8
#The command line interface for the connect_n_game.

require_relative 'process_options'
require_relative 'select_players'
require_relative 'cli_debug'

#Monkey patching the CLI UI into the game.
require_relative 'cli_rack'
require_relative 'cli_human'

module ConnectNGame

  #The Connect N Command Line Interface class.
  class CLI

    #Set up the command line interface
    def initialize
      @players = []
      @order = 4
    end

    #The starting point for an interactive, command-line-driven session
    #of the Connect N Game!
    def main
      welcome
      process_cmd_line
      top_up_players

      play_game

    rescue Interrupt
      puts
    end

    #Play the game
    def play_game
      @game = Game.new(@players[0], @players[1], @order)
      @game.game_initialize

      begin
        current = @game.current
        puts
        result = @game.next_move
        puts "On turn ##{@game.turn}, " +
             "player #{current} " +
             "plays channel #{Utl.channel_to_name(@game.last_move)}."
        @game.rack.cli_display
      end while result == :continue

      if result == :victory
        puts "Player #{@game.current}, #{@game.current_player.name} wins!"
        puts
        puts @game.current_player.winners_comments
        puts @game.previous_player.losers_comments
      elsif result == :stalemate
        puts "No winner, it's a tie!"
      else
        puts "Result is #{result}"
      end

      puts
    end

    #The welcome message.
    def welcome
      puts "Welcome to the Connect N Command Line Interface."
      puts "This is game version: #{VERSION}."
    end

  end
end
