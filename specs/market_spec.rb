require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do

    it "should create an instance of Market" do
      west_seattle = FarMar::Market.new(1, "West Seattle Market", "California & Alaska", "Seattle", "King", "WA", 98116)
      west_seattle.must_be_instance_of(FarMar::Market)
    end

    it "should be able to return Market's name" do
        west_seattle = FarMar::Market.all
        first = west_seattle[1]
        first.name.must_equal("People's Co-op Farmers Market")
    end
  end
  describe "self.all" do
    west_seattle = FarMar::Market.all

    it "should return a collection of instances in a hash" do
        west_seattle.must_be_instance_of(Hash)
    end
  end

  describe "self.find(id)" do
    it "should return an instance of the object matching the id passed" do
      west_seattle = FarMar::Market.find(2)
      west_seattle.id.must_equal(2)
    end
  end
end
