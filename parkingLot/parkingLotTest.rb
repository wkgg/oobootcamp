require_relative('../parkingLot/parking_lot')
require_relative('../parkingLot/car')

describe "parking lot system" do
  it "should store a car" do
    car = Car.new
    parking_lot = ParkingLot.new

    car_index = parking_lot.store(car)

    expect(parking_lot.pick(car_index)).to eq(car)
  end

  it "should store more than one car" do
    car = Car.new
    another_car = Car.new
    parking_lot = ParkingLot.new

    car_index = parking_lot.store(car)
    car_index_of_another_car = parking_lot.store(another_car)

    expect(parking_lot.pick(car_index)).to eq(car)
    expect(parking_lot.pick(car_index_of_another_car)).to eq(another_car)

  end

  it "cannot store a car when packing lot is full" do
    parking_lot = ParkingLot.new 2
    carA = Car.new
    carB = Car.new
    carC = Car.new

    parking_lot.store(carA)
    parking_lot.store(carB)
    expect(parking_lot.store(carC)).to eq(false)
  end
end