# coding: utf-8

module ConnectNGame

  #An invalid move was made.
  class GameInvalidMove < StandardError; end

  #The game is won!
  class GameVictory < StandardError; end

  #The game is a tie!
  class GameDraw < StandardError; end
end