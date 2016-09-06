require_relative 'spec_helper'

describe FarMar::Market do

  describe "#initialize" do
    west_seattle = FarMar::Market.new

    it "should create an instance of Market" do
        west_seattle.must_be_instance_of(FarMar::Market)
    end
  end
end
