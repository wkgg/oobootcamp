class ParkingBoy
  def initialize parking_lots, parking_adapter
    @parking_lots = parking_lots
    @parking_adapter = parking_adapter
  end

  def store car
    parking_lot = @parking_adapter.find_parking_lot @parking_lots
    parking_lot.store car
  end

  def pick ticket
    parking_lot = @parking_lots.find {|parking_lot| parking_lot.can_pick ticket}
    parking_lot.pick ticket if parking_lot != nil
  end
end

class NormalAdapter
  def find_parking_lot parking_lots
    parking_lots.find { |parking_lot| parking_lot.space_left > 0 }
  end
end

class SmartyAdapter
  def find_parking_lot parking_lots
    parking_lots.inject do |memo, word|
      memo.space_left > word.space_left ? memo : word
    end
  end
end

class SuperAdapter
  def find_parking_lot parking_lots
    parking_lots.inject do |memo, word|
      memo.vacancy_rate > word.vacancy_rate ? memo : word
    end
  end
end