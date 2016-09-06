require_relative 'spec_helper'

describe FarMar::Sale do

  describe "#initialize" do
    sales = FarMar::Sale.new

    it "should create an instance of Sale" do
        sales.must_be_instance_of(FarMar::Sale)
    end
  end
end
