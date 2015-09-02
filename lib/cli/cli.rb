# coding: utf-8

#The command line interface for the connect_n_game.

require_relative 'process_options'
require_relative 'select_players'

module ConnectNGame

  #The Connect N Command Line Interface class.
  class CLI

    #Set up the command line interface
    def initialize
      @players = []
    end

    #The starting point for an interactive, command-line-driven session
    #of the Connect N Game!
    def main
      puts "Welcome to the Connect N Command Line Interface."
      puts "Game Version: #{VERSION}."
      puts

      process_cmd_line
      top_up_players
    end

  end
end
