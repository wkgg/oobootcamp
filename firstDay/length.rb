class Length
  attr_accessor :value, :unit

  def initialize value, unit="m"
    @value = value
    @unit = unit
  end

  def == (another_length)

    return UnitConvert.convertToBaseUnit(self.value, self.unit) == UnitConvert.convertToBaseUnit(another_length.value, another_length.unit)

  end
end

class UnitConvert

  def self.convertToBaseUnit(length, unit)
    unitMapping = {
        'cm' => 1,
        'm' => 100,
        'km' => 10000
    }
    return length * unitMapping[unit]
  end
end
