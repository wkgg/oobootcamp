class ParkingBoy
  def initialize parking_lots
    @parkingLots = parking_lots
  end
  def store car
    @parkingLots.first().store(car)
  end

  def pick ticket
    @parkingLots.each { |parking_lot|
      pickedCar = parking_lot.pick(ticket)
      if pickedCar != nil
        return pickedCar
      end
    }
    return nil
  end
end
