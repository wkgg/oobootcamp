class Car

  attr_accessor :car_id
  def initialize (car_id = nil)

    if car_id.nil?
      car_id = Time.now.to_s
    end

    self.car_id  = car_id
  end

  def same? (car)
    return self.car_id == car.car_id
  end
end