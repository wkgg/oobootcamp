class SuperParkingBoy < ParkingBoy
  def store car
    result = @parking_Lots.first
    @parking_Lots.each do |parking_lot|
      result = parking_lot if parking_lot.vacancy_rate() > result.vacancy_rate()
    end
    result.store car
  end
end