class ParkingLot

  STORE_FAILED = -1
  PICK_FAILED = -1

  def initialize (max_space_num)
    @max_space_num = max_space_num
    @parking_space = []
  end

  def store car
    if @parking_space.length >= @max_space_num
      return STORE_FAILED
    else
      @parking_space.push(car)

      return @parking_space.length - 1
    end
  end

  def pick car_index

    if car_index >= 0 && @parking_space[car_index]
      return @parking_space[car_index]
    else
      return PICK_FAILED
    end
  end

end