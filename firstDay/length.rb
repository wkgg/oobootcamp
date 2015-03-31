class Length
  attr_reader :value

  def initialize value
    @value = value
  end

  def == (another_length)
    self.value == another_length.value
  end
end

