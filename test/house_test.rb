require 'minitest/autorun'
require './lib/house'
require './lib/room'
require 'pry'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_its_initial_values
    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

  def test_rooms_exist
    assert_instance_of Room, @room_1
    assert_instance_of Room, @room_2
  end

  def test_adding_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_market_average_comparison
    assert_equal false, @house.above_market_average?
  end

  def test_rooms_categorically
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_house_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end

  def test_house_details_hash
    assert_equal ["price" => 400000, "address" => "123 sugar lane"], [@house.details]
  end

  def test_the_price_per_sqft
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  # def test_sorting_by_area
  #   @house.add_room(@room_1)
  #   @house.add_room(@room_2)
  #   @house.add_room(@room_3)
  #   @house.add_room(@room_4)
  #
  #   assert_equal [@room_4, @room_3, @room_2, @room_1], @house.rooms_sorted_by_area
  # end
end
