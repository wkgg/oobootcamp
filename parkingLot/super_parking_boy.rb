class SuperParkingBoy < ParkingBoy
  def store car
    result = @parking_lots.inject do |memo, word|
      memo.vacancy_rate > word.vacancy_rate ? memo : word
    end
    result.store car
  end
end