# coding: utf-8
#The command line interface for the connect_n_game.

require_relative 'process_options'
require_relative 'select_players'

#Monkey patching the CLI UI into the game.
require_relative 'rack'

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

    end

    #The welcome message.
    def welcome
      puts "Welcome to the Connect N Command Line Interface."
      puts "This is game version: #{VERSION}."
    end

  end
end
