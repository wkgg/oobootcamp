require_relative('../parkingLot/ticket')
class ParkingLot
  def initialize capacity = 10, number
    @storage = []
    @capacity = capacity
    @number = number
  end

  def store car
    if @storage.length >= @capacity
      return false
    end
    @storage.push car
    Ticket.new(@number, @storage.index(car))
  end

  def pick ticket
    @storage[ticket.storage_number] if can_pick ticket
  end

  def can_pick ticket
    ticket.parking_lot_number == @number
  end

  def space_left
    @capacity - @storage.length
  end

  def vacancy_rate
    space_left() / @capacity.to_f
  end
end

