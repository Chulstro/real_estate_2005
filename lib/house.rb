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
end
