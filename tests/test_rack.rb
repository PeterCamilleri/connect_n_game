# coding: utf-8

require_relative '../lib/connect_n_game'
gem              'minitest'
require          'minitest/autorun'

#Test the standard fOOrth library.
class RackTester < Minitest::Test

  #Test that this test was run!
  def test_dummy
    assert_equal(ConnectNGame::VERSION.class, String)
  end

  #Test that we can create racks.
  def test_creating_racks
    assert_raises { ConnectNGame::Rack.new(3) }

    tr = ConnectNGame::Rack.new(4)
    assert_equal(tr.order, 4)
    assert_equal(tr.depth, 6)
    assert_equal(tr.width, 7)
    assert_equal(tr.rack, [[],[],[],[],[],[],[]])

    tr = ConnectNGame::Rack.new(5)
    assert_equal(tr.order, 5)
    assert_equal(tr.depth, 7)
    assert_equal(tr.width, 9)
    assert_equal(tr.rack, [[],[],[],[],[],[],[],[],[]])

    tr = ConnectNGame::Rack.new(6)
    assert_equal(tr.order, 6)
    assert_equal(tr.depth, 9)
    assert_equal(tr.width, 11)
    assert_equal(tr.rack, [[],[],[],[],[],[],[],[],[],[],[]])

    tr = ConnectNGame::Rack.new(7)
    assert_equal(tr.order, 7)
    assert_equal(tr.depth, 10)
    assert_equal(tr.width, 11)
    assert_equal(tr.rack, [[],[],[],[],[],[],[],[],[],[],[]])

    tr = ConnectNGame::Rack.new(8)
    assert_equal(tr.order, 8)
    assert_equal(tr.depth, 12)
    assert_equal(tr.width, 13)
    assert_equal(tr.rack, [[],[],[],[],[],[],[],[],[],[],[],[],[]])

    assert_raises { ConnectNGame::Rack.new(9) }
  end

  #Test that it can retrieve channels
  def test_get_channel
    (4..8).each do |order|
      tr = ConnectNGame::Rack.new(order)

      (1..(tr.width)).each do |ch|
        assert_equal(tr.get_channel(ch), [])
      end
    end
  end

  #Test that it knows when a channel is full
  def test_channel_and_rack_full
    (4..8).each do |order|
      tr = ConnectNGame::Rack.new(order)

      #The channels are being filled.
      (1..tr.depth).each do | _depth |

        refute(tr.rack_full?)

        (1..tr.width).each do | channel |

          refute(tr.channel_full?(channel))

          tr.get_channel(channel) << 1
        end
      end

      #Now all the channels should be full.
      (1..tr.width).each do | channel |
        assert(tr.channel_full?(channel))
      end

      assert(tr.rack_full?)
    end
  end

  #Test that we can query individual cells
  def test_get_cell
    tr = ConnectNGame::Rack.new(4)
    assert_equal(tr.get_cell(1,1), nil)
    assert_equal(tr.get_cell(1,2), nil)
    assert_equal(tr.get_cell(1,3), nil)

    tr.get_channel(1) << 1
    assert_equal(tr.get_cell(1,1), 1)
    assert_equal(tr.get_cell(1,2), nil)
    assert_equal(tr.get_cell(1,3), nil)

    tr.get_channel(1) << -1
    assert_equal(tr.get_cell(1,1), 1)
    assert_equal(tr.get_cell(1,2), -1)
    assert_equal(tr.get_cell(1,3), nil)

    tr.get_channel(1) << 1
    assert_equal(tr.get_cell(1,1), 1)
    assert_equal(tr.get_cell(1,2), -1)
    assert_equal(tr.get_cell(1,3), 1)
  end

  #Test that we can play a channel.
  def test_play_channel
    tr = ConnectNGame::Rack.new(4)

    assert_equal(1, tr.play_channel(1, 1))
    assert_equal(1, tr.play_channel(1, 1))
    assert_equal(1, tr.play_channel(1, 1))
    assert_equal(1, tr.play_channel(1, 1))
    assert_equal(1, tr.play_channel(1, 1))
    assert_equal(1, tr.play_channel(1, 1))

    assert_raises(ConnectNGame::GameInvalidMove) do
      tr.play_channel(1, 1)
    end
  end

  #Test getting the free row for a channel
  def test_channel_to_row
    tr = ConnectNGame::Rack.new(4)

    assert_equal(1, tr.channel_to_row(1))

    tr.play_channel(1,1)
    assert_equal(2, tr.channel_to_row(1))

    tr.play_channel(1,1)
    assert_equal(3, tr.channel_to_row(1))

    tr.play_channel(1,1)
    assert_equal(4, tr.channel_to_row(1))

    tr.play_channel(1,1)
    assert_equal(5, tr.channel_to_row(1))

    tr.play_channel(1,1)
    assert_equal(6, tr.channel_to_row(1))

    tr.play_channel(1,1)
    assert_equal(nil, tr.channel_to_row(1))
  end

  #Test that we can count cells around a position.
  def test_score_move
    tr = ConnectNGame::Rack.new(4)

    assert_equal(1, tr.score_move(3,1))
    tr.play_channel(3,1)

    assert_equal(2, tr.score_move(3,1))
    tr.play_channel(4,1)

    assert_equal(2, tr.score_move(4,1))
    tr.play_channel(4,1)

    assert_equal(2, tr.score_move(3,1))
    tr.play_channel(3,1)

    assert_equal(3, tr.score_move(3,1))
    tr.play_channel(3,1)

    assert_equal(4, tr.score_move(3,1))

    #It should not hang either!
    assert_raises { tr.score_move(3,nil) }

  end

end
