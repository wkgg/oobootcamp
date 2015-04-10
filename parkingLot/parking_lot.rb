class ParkingLot
  attr_accessor :space
  def initialize name, capacity = 10
    @name = name
    @storage = []
    @capacity = capacity
  end

  def store car
    if @storage.length >= @capacity
      return false
    end
    @storage.push car
    @space = @capacity - @storage.length
    @storage.index(car)
  end

  def pick car_index
    @storage[car_index]
  end
end