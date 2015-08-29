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

end
