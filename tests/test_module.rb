# coding: utf-8

require_relative '../lib/connect_n_game'
gem              'minitest'
require          'minitest/autorun'

#Test the standard fOOrth library.
class ConnectNGameTester < Minitest::Test

  #Test that all the pieces are in the box!
  def test_modules_and_classes_exist
    assert_equal(ConnectNGame.class, Module)
    assert_equal(ConnectNGame::VERSION.class, String)
    assert_equal(ConnectNGame::Game.class, Class)
    assert_equal(ConnectNGame::Player.class, Class)
    assert_equal(ConnectNGame::UI.class, Class)
  end


end
