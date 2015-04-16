class Car
  
  def initialize (car_id = nil)

    if car_id.nil?
      @car_id = Time.now.to_i
    end

    !car_id = car_id
  end

  def same? (car)
    return @car_id == car.to_s
  end

  def to_s
    return @car_id
  end
end


class ParkingLot

  def initialize (max_space_num = 10)
    @max_space_num = max_space_num
    @parking_space = []
  end

  def store car
    if !self.can_store?
      return false
    else
      @parking_space.push(car)

      return true
    end
  end

  def pick car_id

    carIndex = self.findCarIndex(car_id)
    if carIndex < 0
      return false
    else
      picked_car = @parking_space[carIndex]
      @parking_space.delete_at(carIndex)

      return picked_car
    end;
  end

  def can_store?
    return @parking_space.length < @max_space_num
  end

  def can_pick? car_id

    return self.findCarIndex(car_id) >= 0
  end

  def free_space_count
    return @max_space_num - @parking_space.length
  end

  def free_space_rate
    return self.free_space_count.to_f / @max_space_num.to_f
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

  def initialize(parking_lots = [])

    if parking_lots.length <= 0
      parking_lots = [
          ParkingLot.new,
          ParkingLot.new,
          ParkingLot.new
      ]
    end

    @parking_lots = parking_lots
    @store_adapter = DefaultParkingLotStoreAdapter.new
  end

  def set_store_adapter(store_adapter)
    @store_adapter = store_adapter
  end

  def store(car)
    return @store_adapter.store(@parking_lots, car)
  end

  def pick(car_id)

    picked_car = false

    @parking_lots.each do |item|
      if item.can_pick?(car_id)
        picked_car = item.pick(car_id)
        break
      end
    end

    return picked_car
  end
end

class DefaultParkingLotStoreAdapter
  def store(parking_lots, car)
    parkingLot = nil

    parking_lots.each do |item|
      if item.can_store?
        parkingLot = item
        break
      end
    end

    return parkingLot.store(car)
  end
end

class ParkToTheMostFreeSpaceParkingLotStoreAdapter
  def store(parking_lots, car)

    parkingLot = nil

    parking_lots.each do |item|
      if parkingLot.nil?
        parkingLot = item
      elsif item.free_space_count > parkingLot.free_space_count
        parkingLot = item
      end
    end

    return parkingLot.store(car)
  end
end

class ParkToTheMostFreeSpaceRateParkingLotStoreAdapter
  def store(parking_lots, car)
    parkingLot = nil

    parking_lots.each do |item|
      if parkingLot.nil?
        parkingLot = item
      elsif item.free_space_rate > parkingLot.free_space_rate
        parkingLot = item
      end
    end

    return parkingLot.store(car)
  end
end