require_relative 'common'

describe "parking lot system" do
  it "should store a car" do

    parking_lot = ParkingLot.new

    car = Car.new

    expect(parking_lot.store(car)).to eq(true)
    expect(parking_lot.pick(car.to_s)).to eq(car)
  end

  it "cannot pick the car when not store to parking lot" do

    parking_lot = ParkingLot.new

    expect(parking_lot.pick(0)).to eq(false)
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

    expect(parking_lot.store(Car.new)).to eq(true)
    expect(parking_lot.store(Car.new)).to eq(true)

    expect(parking_lot.store(Car.new)).to eq(false)
  end

  it "cannot pick the car twice" do

    parking_lot = ParkingLot.new
    car = Car.new

    expect(parking_lot.store(Car.new)).to eq(true)
    expect(car.same?(parking_lot.pick(car.to_s))).to eq(true)

    expect(parking_lot.can_pick?(car.to_s)).to eq(false)
  end

  it "should parking a car by parking boy" do

    car = Car.new
    parking_boy = ParkingBoy.new

    parking_boy.store(car)
    picked_car = parking_boy.pick(car.to_s);

    expect(car.same?(picked_car)).to eq(true)
  end

  it "should can pick the car who parked by parking boy from one of the parking lots" do
    parking_lots = [
        ParkingLot.new,
        ParkingLot.new,
    ]
    parking_boy = ParkingBoy.new(parking_lots)
    car = Car.new

    parking_boy.store(car)

    picked_car = nil
    parking_lots.each do |parking_lot|
      if parking_lot.can_pick?(car.to_s)
        picked_car = parking_lot.pick(car.to_s)
        break
      end
    end

    expect(car.same?(picked_car)).to eq(true)
  end

  it "should can parking the car to the one of the most free space of two parking lots by smart parking boy" do

    parkingLotFree10Space = ParkingLot.new(10)
    parkingLotFree5Space = ParkingLot.new(5)

    smarty_parking_boy = ParkingBoy.new([parkingLotFree10Space, parkingLotFree5Space])
    car = Car.new

    smarty_parking_boy.set_store_adapter(ParkToTheMostFreeSpaceParkingLotStoreAdapter.new)
    smarty_parking_boy.store(car)

    picked_car = parkingLotFree10Space.pick(car.to_s)
    expect(car.same?(picked_car)).to eq(true)
  end

  it "should can parking the car to the one of the most free space rate of two parking lots by super parking boy" do

    parkingLotWithMoreFreeSpaceRate = ParkingLot.new(20)
    parkingLotWithLessFreeSpaceRate = ParkingLot.new(9)

    17.times do
      parkingLotWithMoreFreeSpaceRate.store(Car.new)
    end

    6.times do
      parkingLotWithLessFreeSpaceRate.store(Car.new)
    end

    super_parking_boy = ParkingBoy.new([parkingLotWithMoreFreeSpaceRate, parkingLotWithLessFreeSpaceRate])
    car = Car.new

    super_parking_boy.set_store_adapter(ParkToTheMostFreeSpaceRateParkingLotStoreAdapter.new)
    super_parking_boy.store(car)

    picked_car = parkingLotWithMoreFreeSpaceRate.pick(car.to_s)
    expect(car.same?(picked_car)).to eq(true)
  end

  it "should can parking the car to the one of the most free space rate of two parking lots by super parking boy for different parking lots order in super parking boy" do

    parkingLotWithMoreFreeSpaceRate = ParkingLot.new(20)
    parkingLotWithLessFreeSpaceRate = ParkingLot.new(9)

    17.times do
      parkingLotWithMoreFreeSpaceRate.store(Car.new)
    end

    6.times do
      parkingLotWithLessFreeSpaceRate.store(Car.new)
    end

    super_parking_boy = ParkingBoy.new([parkingLotWithLessFreeSpaceRate, parkingLotWithMoreFreeSpaceRate])
    car = Car.new

    super_parking_boy.set_store_adapter(ParkToTheMostFreeSpaceRateParkingLotStoreAdapter.new)
    super_parking_boy.store(car)

    picked_car = parkingLotWithMoreFreeSpaceRate.pick(car.to_s)
    expect(car.same?(picked_car)).to eq(true)
  end
end