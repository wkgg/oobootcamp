class ParkingLot
  def initialize num = 10
    @storage = []
    @max_space_num = num
  end

  def store car
    if @storage.length >= @max_space_num
      return false
    end
    @storage.push car
    @storage.index(car)
  end

  def pick car_index
    @storage[car_index]
  end
end