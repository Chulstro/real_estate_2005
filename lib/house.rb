require './lib/room'
require 'pry'

class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(cost, address)
    @price = cost.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price >= 500000
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

  def details
    detail = {
      "price" => @price,
      "address" => @address
    }
    detail
  end

  def price_per_square_foot
    sqft_price = @price.to_f / self.area.to_f
    sqft_price.round(2)
  end

  # def rooms_sorted_by_area
  #   sorted_rooms =[]
  #   @rooms.each do |room|
  #     room = room
  #     binding.pry
  #     if sorted_rooms = []
  #       sorted_rooms << room
  #     elsif room.area > sorted_rooms[0].area
  #       sorted_rooms.insert(0,room)
  #     elsif room.area < sorted_rooms[0].area
  #       sorted_rooms.insert(1, room)
  #     elsif room.area > sorted_rooms[2].area
  #       sorted_rooms.insert(2, room)
  #     elsif room.area > sorted_rooms[3].area
  #       sorted_rooms.insert(3, room)
  #     end
  #   end
  #   sorted_rooms
  # end
end
