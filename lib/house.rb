require './lib/room'
require 'pry'

class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(cost, address)
    @price = cost
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price.to_i >= 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    cat_rooms = []
    category = category
    @rooms.each do |room|
      if room.category == category
        cat_rooms << room
      end
    end
    cat_rooms
  end

  def area
    area = 0
    @rooms.each do |room|
      area += room.area
    end
    area
  end
end
