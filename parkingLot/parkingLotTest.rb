require_relative('../parkingLot/parking_lot')
require_relative('../parkingLot/car')

describe "parking lot system" do
  it "should store a car and pick it" do
    car = Car.new
    parking_lot = ParkingLot.new

    car_index = parking_lot.store(car)

    expect(parking_lot.pick(car_index)).to eq(car)
  end

  it "should store more than one car and pick them" do
    car = Car.new
    another_car = Car.new
    parking_lot = ParkingLot.new

    car_index = parking_lot.store(car)
    car_index_of_another_car = parking_lot.store(another_car)

    expect(parking_lot.pick(car_index)).to eq(car)
    expect(parking_lot.pick(car_index_of_another_car)).to eq(another_car)

  end

  it "cannot store a car when parking lot is full" do
    parking_lot = ParkingLot.new 2

    parking_lot.store(Car.new)
    parking_lot.store(Car.new)
    expect(parking_lot.store(Car.new)).to eq(false)
  end

  it "should store a car from parking boy and get it from parking boy" do
    parking_lot = ParkingLot.new
    parking_boy = ParkingBoy.new parking_lot
    car = Car.new
    ticket = parking_boy.store(car)
    expect(parking_boy.pick(ticket)).to eq(car)
  end

  it "should store a car from parking boy and get it from parking lot" do
    parking_lot = ParkingLot.new
    parking_boy = ParkingBoy.new parking_lot
    car = Car.new
    ticket = parking_boy.store(car)
    expect(parking_lot.pick(ticket)).to eq(car)
  end

  it "should store a car into parking lot and get from parking boy" do
    parking_lot = ParkingLot.new
    parking_boy = ParkingBoy.new parking_lot
    car = Car.new
    ticket = parking_lot.store(car)
    expect(parking_boy.pick(ticket)).to eq(car)
  end

  it "should store a car from parking boy and get it from one of the parking lots" do
    parking_lots = [ParkingLot.new, ParkingLot.new]
    parking_boy = ParkingBoy.new parking_lots
    car = Car.new

    ticket =
  end

end

class ParkingBoy
  def initialize parking_lot
    @parkingLot = parking_lot
  end
  def store car
    @parkingLot.store(car)
  end

  def pick ticket
    @parkingLot.pick(ticket)
  end
end