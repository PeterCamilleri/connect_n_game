# coding: utf-8

require_relative '../lib/connect_n_game'
gem              'minitest'
require          'minitest/autorun'

#Test the standard fOOrth library.
class GameTester < Minitest::Test

  #Test that this test was run!
  def test_dummy
    assert_equal(ConnectNGame::VERSION.class, String)
  end

  #Test that it knows how to play.
  def test_taking_turns
    pl1 = ConnectNGame::Player.new("A", "OK",   :silicon)
    pl2 = ConnectNGame::Player.new("B", "GOOD", :carbon)

    game = ConnectNGame::Game.new(pl1, pl2)

    assert_equal(4, game.rack.order)
    assert_equal(pl1, game.current_player)
    assert_equal(:continue, game.next_move)

    assert_equal(pl2, game.current_player)
    assert_equal(:continue, game.next_move)

    assert_equal(pl1, game.current_player)
    assert_equal(:continue, game.next_move)

    assert_equal(pl2, game.current_player)
    assert_equal(:continue, game.next_move)

    assert_equal(pl1, game.current_player)
    assert_equal(:continue, game.next_move)

    assert_equal(pl2, game.current_player)
    assert_equal(:continue, game.next_move)

    assert_equal(pl1, game.current_player)
    assert_equal(:victory, game.next_move)
  end


end
