# coding: utf-8
#The command line interface for the connect_n_game.

require_relative 'process_options'
require_relative 'select_players'

#Monkey patching the CLI UI into the game.
require_relative 'cli_rack'

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
        @game.rack.cli_display
        result = @game.next_move
        puts
      end while result == :continue

      @game.rack.cli_display

      if result == :victory
        puts "Player #{@game.current}, #{@game.current_player.name} wins!"
      elsif result == :stalemate
        puts "No winner, it's a tie!"
      else
        puts "Result is #{result}"
      end
    end

    #The welcome message.
    def welcome
      puts "Welcome to the Connect N Command Line Interface."
      puts "This is game version: #{VERSION}."
    end

  end
end
