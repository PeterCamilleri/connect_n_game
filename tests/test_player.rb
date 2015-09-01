# coding: utf-8

require_relative '../lib/connect_n_game'
gem              'minitest'
require          'minitest/autorun'

#Test the standard fOOrth library.
class PlayerTester < Minitest::Test

  #Test that this test was run!
  def test_dummy
    assert_equal(String, ConnectNGame::VERSION.class)
  end

  def test_abstract_behaviours
    #It should have the attributes of name, description, and type.
    atp = ConnectNGame::Player.new("Ted", "Cool", :carbon)
    assert_equal("Ted", atp.name)
    assert_equal("Cool", atp.description)
    assert_equal(:carbon, atp.type)
    assert(atp.carbon?)
    refute(atp.silicon?)

    #It should reject invalid player types.
    assert_raises { ConnectNGame::Player.new("Ted", "Cool", :germanium) }
  end

  #We should be able to sort players alphabetically by name.
  def test_that_it_is_sortable
    aop = []
    aop << ConnectNGame::Player.new("Ted",   "Cool",    :carbon)
    aop << ConnectNGame::Player.new("apple", "Cooler",  :silicon)
    aop << ConnectNGame::Player.new("Ed",    "Coolest", :carbon)

    aop.sort! {|a,b| a.name.casecmp(b.name) }

    assert_equal("apple", aop[0].name)
    assert(aop[0].silicon?)
    refute(aop[0].carbon?)

    assert_equal("Ed",    aop[1].name)
    refute(aop[1].silicon?)
    assert(aop[1].carbon?)

    assert_equal("Ted",   aop[2].name)
    refute(aop[2].silicon?)
    assert(aop[2].carbon?)
  end

  #Test that it loads up available players.
  def test_player_loading
    assert_equal(Array, ConnectNGame::Player.players.class)
  end

end
