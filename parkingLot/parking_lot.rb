class ParkingLot
  def initialize capacity = 10
    @storage = []
    @capacity = capacity
  end

  def store car
    if @storage.length >= @capacity
      return false
    end
    @storage.push car
    @storage.index(car)
  end

  def pick car_index
    @storage[car_index]
  end
end