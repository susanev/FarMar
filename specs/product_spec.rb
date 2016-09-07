require_relative 'spec_helper'

describe FarMar::Product do

  describe "#initialize" do
    fruit = FarMar::Product.new(123,"Veg Cheez", 5)

    it "should create an instance of Product" do
        fruit.must_be_instance_of(FarMar::Product)
    end
  end

  describe "self.all" do
    fruit = FarMar::Product.all

    it "should return a collection of instances in a hash" do
        fruit.must_be_instance_of(Hash)
    end
  end

  describe "self.find(id)" do
    it "should return an instance of the object matching the id passed" do
      fruit = FarMar::Product.find(2)
      fruit.id.must_equal(2)
    end
  end
end
