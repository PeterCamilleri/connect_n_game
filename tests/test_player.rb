# coding: utf-8

require_relative '../lib/connect_n_game'
gem              'minitest'
require          'minitest/autorun'

#Test the standard fOOrth library.
class PlayerTester < Minitest::Test

  #Test that this test was run!
  def test_dummy
    assert_equal(ConnectNGame::VERSION.class, String)
  end

  def test_abstract_behaviours
    #It should have the attributes of name, description, and type.
    atp = ConnectNGame::Player.new("Ted", "Cool", :carbon)
    assert_equal(atp.name, "Ted")
    assert_equal(atp.description, "Cool")
    assert_equal(atp.type, :carbon)

    #It should reject invalid player types.
    assert_raises { ConnectNGame::Player.new("Ted", "Cool", :germanium) }
  end


end
