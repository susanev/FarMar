require_relative 'spec_helper'

describe FarMar::Product do

  describe "#instance" do
    fruit = FarMar::Product.new
    
    it "should create an instance of Product" do
        fruit.must_be_instance_of(FarMar::Product)
    end
  end
end
