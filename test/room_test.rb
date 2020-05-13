require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test
  def test_it_exists
    room = Room.new(:bedroom, 10, '13')
    assert_instance_of Room, room
  end

  def test_it_has_a_category

    room = Room.new(:bedroom, 10, '13')
    assert_equal :bedroom, room.category
  end

  def test_it_can_get_area

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:living_room, 15, '12')
    assert_equal 130, room_1.area
    assert_equal 180, room_2.area
  end

  def test_it_starts_unpained
    room_1 = Room.new(:bedroom, 10, '13')

    assert_equal false, room_1.is_painted?
  end

  def test_it_can_be_painted
    room_1 = Room.new(:bedroom, 10, '13')

    room_1.paint
    assert_equal true, room_1.is_painted?
  end
end
