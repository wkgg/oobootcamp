describe "parking lot system" do
  it "should store a car" do
    car = Car.new
    expect(ParkingLot.pick(ParkingLot.store(car))).to eq(car)
  end

  it "should cannot store a car when packing lot is full" do
    parkingLot = ParkingLot.new 1
    carA = Car.new
    carB = Car.new

    ParkingLot.store(carA)


    expect(ParkingLot.store(carB)).to eq(false)
  end
end

class ParkingLot

  def initialize num
    @num = num
    @storage = null
  end

  def store car do

    if @storage == null
      @storage = car
      return true
    else
      return false
    end
  end

  def pick

    if @storage == null
      reutrn false
    else
      return @storage
    end

  end

end

class Car

end