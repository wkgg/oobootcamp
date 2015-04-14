class ParkingBoy
  def initialize parking_lots
    @parking_Lots = parking_lots
  end
  def store car
    @parking_Lots.first.store(car)
  end

  def pick ticket
    @parking_Lots.each do |parking_lot|
      if parking_lot.can_pick ticket
        return parking_lot.pick ticket
      end
    end
  end
end