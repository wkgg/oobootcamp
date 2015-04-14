class Ticket
  attr_reader :parking_lot_number, :storage_number

  def initialize parking_lot_number, storage_number
    @parking_lot_number = parking_lot_number
    @storage_number = storage_number
  end
end