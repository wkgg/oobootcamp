class SmartyParkingBoy < ParkingBoy
  def store car
    result = @parking_lots.inject do |memo, word|
      memo.space_left > word.space_left ? memo : word
    end

    result.store car
  end
end