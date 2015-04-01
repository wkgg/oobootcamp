require_relative 'length'

describe "compare two length" do
  it "shoud be equal when their length is same" do

    lengthA = Length.new 5
    lengthB = Length.new 5

    expect(lengthA == lengthB).to eq(true)
  end

  it "shoud not be equal when their length is not same" do

    lengthA = Length.new 5
    lengthB = Length.new 4

    expect(lengthA == lengthB).to eq(false)
  end

  it "should not be equal when their length number is same but length unit is not same" do

    lengthA = Length.new 5, "m"
    lengthB = Length.new 5, "cm"

    expect(lengthA == lengthB).to eq(false)
  end

  it "should be equal when their length number is same and length unit is same" do

    lengthA = Length.new 5, "cm"
    lengthB = Length.new 5, "cm"

    expect(lengthA == lengthB).to eq(true)
  end

  it "should be equal when lengthA is 500cm and lengthB is 5m" do

    lengthA = Length.new 500, "cm"
    lengthB = Length.new 5, "m"

    expect(lengthA == lengthB).to eq(true)
  end

  it "should be equal when lengthA is 50000cm and lengthB is 5km" do

    lengthA = Length.new 50000, "cm"
    lengthB = Length.new 5, "km"

    expect(lengthA == lengthB).to eq(true)
  end

end