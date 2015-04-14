require_relative('../parkingLot/parking_lot')
require_relative('../parkingLot/car')
require_relative('../parkingLot/parking_boy')
require_relative('../parkingLot/smarty_parking_boy')
require_relative('../parkingLot/super_parking_boy')
require('pry')

describe "parking lot system" do
  it "should store a car and pick it" do
    car = Car.new
    parking_lot = ParkingLot.new 1

    car_index = parking_lot.store(car)

    expect(parking_lot.pick(car_index)).to eq(car)
  end

  it "should store more than one car and pick them" do
    car = Car.new
    another_car = Car.new
    parking_lot = ParkingLot.new 1

    car_index = parking_lot.store(car)
    car_index_of_another_car = parking_lot.store(another_car)

    expect(parking_lot.pick(car_index)).to eq(car)
    expect(parking_lot.pick(car_index_of_another_car)).to eq(another_car)

  end

  it "cannot store a car when parking lot is full" do
    parking_lot = ParkingLot.new 2, 1

    parking_lot.store(Car.new)
    parking_lot.store(Car.new)
    expect(parking_lot.store(Car.new)).to eq(false)
  end

  it "should store a car from parking boy and get it from parking boy" do
    parking_lot = ParkingLot.new 1
    parking_boy = ParkingBoy.new [parking_lot]
    car = Car.new
    ticket = parking_boy.store(car)
    expect(parking_boy.pick(ticket)).to eq(car)
  end

  it "should store a car from parking boy and get it from parking lot" do
    parking_lot = ParkingLot.new 1
    parking_boy = ParkingBoy.new [parking_lot]
    car = Car.new
    ticket = parking_boy.store(car)
    expect(parking_lot.pick(ticket)).to eq(car)
  end

  it "should store a car into parking lot and get from parking boy" do
    parking_lot = ParkingLot.new 1
    parking_boy = ParkingBoy.new [parking_lot]
    car = Car.new
    ticket = parking_lot.store(car)
    expect(parking_boy.pick(ticket)).to eq(car)
  end

  it "should store a car from parking boy and get it from one of the parking lots" do
    parking_lot = ParkingLot.new 1
    another_parking_lot = ParkingLot.new 2
    parking_lots = [parking_lot, another_parking_lot]
    parking_boy = ParkingBoy.new parking_lots
    car = Car.new

    ticket = parking_boy.store car

    expect(parking_lot.pick (ticket)).to eq(car)
  end

  it "should store to the parkingLotB when parking_lot_A has 5 left empty car storage and parking_lot_B has 6 left empty car storage for smarty parking boy" do
    parking_lot_A = ParkingLot.new 6, 1
    parking_lot_B = ParkingLot.new 6, 2
    parking_lot_A.store(Car.new)

    smarty_parking_boy = SmartyParkingBoy.new [parking_lot_A, parking_lot_B]
    car = Car.new

    ticket = smarty_parking_boy.store car

    expect(parking_lot_B.pick (ticket)).to eq(car)
  end

  it "should get car form parkingLotB when super parking boy store the car given parkingLotB with 6/7 and parking_lot_A with 4/5" do
    parking_lot_A = ParkingLot.new 5, 1
    parking_lot_B = ParkingLot.new 7, 2
    parking_lot_A.store(Car.new)
    parking_lot_B.store(Car.new)

    super_parking_boy = SuperParkingBoy.new [parking_lot_A, parking_lot_B]
    car = Car.new

    ticket = super_parking_boy.store car

    expect(parking_lot_B.pick (ticket)).to eq(car)
  end

end


