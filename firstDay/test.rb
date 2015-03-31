
describe "compare two length" do
    it "shoud be false when their length is not same" do

      lengthA = Length.new 5
      lengthB = Length.new 4

      expect(lengthA.equal? lengthB).to eq(false)

    end

    it "shoud be true when their length is same" do

      lengthA = Length.new 5
      lengthB = Length.new 5

      expect(lengthA.get == lengthB.get).to eq(true)

    end

end

class Length

  def initialize value
    @value = value
  end

  def get
      return @value
  end
end

