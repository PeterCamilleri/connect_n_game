# coding: utf-8
#Display and select player options.

module ConnectNGame

  class CLI

    #Select all new players
    def select_new_players
      @players = []
      top_up_players
    end

    #Make sure we have two players
    def top_up_players
      pick_a_player while @players.length < 2
    end

    #Have the user pick a player.
    def pick_a_player
      begin
        show_players
        print "\nEnter player #{@players.length+1} name: "
        input = gets.chop
        player = find_player(input)
        puts "invalid entry #{input.inspect}" unless player
      end until player

      @players << player
    end

    #Display the available players
    def show_players
      puts
      puts "Supported players: "

      width = (Player.players.map do |player|
        player.name.length
      end).max

      Player.players.each do |player|
        puts "  #{player.name.ljust(width+1)}  #{player.description}"
      end

      puts
    end

    #Find the selected player.
    def find_player(arg)
      Player.players.find do |player|
        player.name.downcase == arg.downcase
      end
    end

  end
end
