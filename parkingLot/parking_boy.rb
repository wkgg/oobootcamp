class ParkingBoy
  def initialize parking_lots
    @parking_lots = parking_lots
  end
  def store car
    @parking_lots.first.store(car)
  end

  def pick ticket
    @parking_lots.each do |parking_lot|
      if parking_lot.can_pick ticket
        return parking_lot.pick ticket
      end
    end
  end
end