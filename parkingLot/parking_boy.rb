class ParkingBoy
  def initialize parking_lots
    @parking_lots = parking_lots
  end
  def store car
    parking_lot = @parking_lots.find {|parking_lot| parking_lot.space_left > 0 }
    parking_lot.store car
  end

  def pick ticket
    parking_lot = @parking_lots.find {|parking_lot| parking_lot.can_pick ticket}
    parking_lot.pick ticket if parking_lot != nil
  end
end