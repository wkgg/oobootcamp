class Car

  attr_accessor :car_id

  def initialize (car_id = nil)

    if car_id.nil?
      car_id = Time.now.to_i
    end

    self.car_id = car_id
  end

  def same? (car)
    return self.car_id == car.to_s
  end

  def to_s
    return self.car_id
  end
end


class ParkingLot

  STORE_FAILED = false
  STORE_SUCCEED = true
  PICK_FAILED = false

  def initialize (max_space_num = 10)
    @max_space_num = max_space_num
    @car_count = 0
    @parking_space = []
  end

  def store car
    if !self.canStore?
      return STORE_FAILED
    else
      @parking_space.push(car)
      @car_count += 1

      return STORE_SUCCEED
    end
  end

  def pick car_id

    carIndex = self.findCarIndex(car_id)
    if carIndex < 0
      return PICK_FAILED
    else
      @car_count -= 1
      picked_car = @parking_space[carIndex]

      @parking_space.delete_at(carIndex)

      return picked_car
    end;
  end

  def canStore?
    return @parking_space.length < @max_space_num
  end

  def canPick? car_id

    return self.findCarIndex(car_id) >= 0
  end

  def findCarIndex car_id
    car_index = -1
    @parking_space.each_with_index do |item, index|

      if item.to_s == car_id
        car_index = index
        break
      end
    end

    return car_index
  end
end

class ParkingBoy

  STORE_FAILED = false
  STORE_SUCCEED = true
  PICK_FAILED = false

  def initialize(parking_lots = [])

    if parking_lots.length <= 0
      parking_lots = [
          ParkingLot.new,
          ParkingLot.new,
          ParkingLot.new
      ]
    end

    @parking_lots = parking_lots
  end

  def store(car)

    stored = ParkingBoy::STORE_FAILED

    @parking_lots.each do |item|
      if item.store(car) == ParkingLot::STORE_SUCCEED
        stored = ParkingBoy::STORE_SUCCEED
        break
      end
    end

    return stored
  end

  def pick(car_id)

    picked_car = ParkingBoy::PICK_FAILED

    @parking_lots.each do |item|
      if item.canPick?(car_id)
        picked_car = item.pick(car_id)
        break
      end
    end

    return picked_car
  end
end
