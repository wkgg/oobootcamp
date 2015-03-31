require_relative 'length'

describe "compare two length" do
  it "shoud be equal when their length is same" do

    lengthA = Length.new 5
    lengthB = Length.new 5

    expect(lengthA == lengthB).to eq(true)
  end

  it "shoud be not equal when their length is not same" do

    lengthA = Length.new 5
    lengthB = Length.new 4

    expect(lengthA == lengthB).to eq(false)
  end

end