require_relative 'spec_helper'

describe FarMar::Sale do

  describe "#initialize" do
    sales = FarMar::Sale.new(324, 12.12, 1230, 23, 5)

    it "should create an instance of Sale" do
        sales.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "self.all" do
    fruit = FarMar::Sale.all

    it "should return a collection of instances in a hash" do
        fruit.must_be_instance_of(Hash)
    end
  end

  describe "self.find(id)" do
    it "should return an instance of the object matching the id passed" do
      fruit = FarMar::Sale.find(2)
      fruit.id.must_equal(2)
    end
  end
end
