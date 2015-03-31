class Length
  attr_reader :value,:unit

  def initialize value, unit="m"
    @value = value
    @unit = unit
  end

  def == (another_length)
    self.value == another_length.value && self.unit == another_length.unit
  end
end

