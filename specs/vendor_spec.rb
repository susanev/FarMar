require_relative 'spec_helper'

describe FarMar::Market do

  describe "#initialize" do
    vegan_cheez = FarMar::Vendor.new

    it "should create an instance of Vendor" do
        vegan_cheez.must_be_instance_of(FarMar::Vendor)
    end
  end
end
