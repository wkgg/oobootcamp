require_relative 'car'
require_relative 'parking_lot'

describe "parking lot system" do
  it "should store a car" do

    parking_lot = ParkingLot.new(1)

    car = Car.new

    expect(parking_lot.pick(parking_lot.store(car))).to eq(car)
  end

  it "should cannot pick car when packing lot has no cars" do

    parking_lot = ParkingLot.new(1)

    expect(parking_lot.pick(0)).to eq(ParkingLot::PICK_FAILED)
  end

  it "should pick same car when store a car" do

    parking_lot = ParkingLot.new(1)

    carA = Car.new('201504081344')

    pickedCar = parking_lot.pick(parking_lot.store(carA))

    expect(carA.same?(pickedCar)).to eq(true)
  end

  it "should cannot store more than two cars when packing lot has 2 max space" do

    parking_lot = ParkingLot.new(2)

    carA = Car.new
    carB = Car.new

    carC = Car.new

    expect(parking_lot.store(carA)).to eq(0)
    expect(parking_lot.store(carB)).to eq(1)
    expect(parking_lot.store(carC)).to eq(ParkingLot::STORE_FAILED)
  end
end