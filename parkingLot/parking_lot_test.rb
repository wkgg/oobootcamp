require_relative 'common'

describe "parking lot system" do
  it "should store a car" do

    parking_lot = ParkingLot.new

    car = Car.new

    expect(parking_lot.store(car)).to eq(ParkingLot::STORE_SUCCEED)
    expect(parking_lot.pick(car.to_s)).to eq(car)
  end

  it "cannot pick car when packing lot has no cars" do

    parking_lot = ParkingLot.new

    expect(parking_lot.pick(0)).to eq(ParkingLot::PICK_FAILED)
  end

  it "should pick same car when store a car" do

    parking_lot = ParkingLot.new

    car = Car.new

    parking_lot.store(car)

    pickedCar = parking_lot.pick(car.to_s)

    expect(car.same?(pickedCar)).to eq(true)
  end

  it "cannot store more than two cars when packing lot has 2 max space" do

    parking_lot = ParkingLot.new(2)

    expect(parking_lot.store(Car.new)).to eq(ParkingLot::STORE_SUCCEED)
    expect(parking_lot.store(Car.new)).to eq(ParkingLot::STORE_SUCCEED)
    expect(parking_lot.store(Car.new)).to eq(ParkingLot::STORE_FAILED)
  end

  it "cannot pick the car twice" do

    parking_lot = ParkingLot.new
    car = Car.new

    expect(parking_lot.store(Car.new)).to eq(ParkingLot::STORE_SUCCEED)

    expect(car.same?(parking_lot.pick(car.to_s))).to eq(true)

    expect(parking_lot.canPick?(car.to_s)).to eq(false)
  end

  it "should parking a car by parking boy" do

    car = Car.new
    parking_boy = ParkingBoy.new

    expect(parking_boy.store(car)).to eq(ParkingBoy::STORE_SUCCEED)

    picked_car = parking_boy.pick(car.to_s);

    expect(car.same?(picked_car)).to eq(true)
  end

  it "should can pick the car who parked by parking boy from one of the parking lots" do
    parking_lots = [
        ParkingLot.new,
        ParkingLot.new,
        ParkingLot.new,
    ]
    parking_boy = ParkingBoy.new(parking_lots)
    car = Car.new

    expect(parking_boy.store(car)).to eq(ParkingBoy::STORE_SUCCEED)

    picked_car = nil
    parking_lots.each do |parking_lot|
      if parking_lot.canPick?(car.to_s)
        picked_car = parking_lot.pick(car.to_s)
        break
      end
    end

    expect(car.same?(picked_car)).to eq(true)
  end
end