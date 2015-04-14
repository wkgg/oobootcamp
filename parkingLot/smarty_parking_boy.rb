class SmartyParkingBoy < ParkingBoy
  def store car
    result = @parking_Lots.first
    @parking_Lots.each do |parking_lot|
      result = parking_lot if parking_lot.space_left() > result.space_left()
    end
    result.store car
  end
end