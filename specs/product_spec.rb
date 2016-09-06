require_relative 'spec_helper'
require_relative '../far_mar'

describe 'Product::Testing reading from csv' do
	it 'must be able to create objects from csv' do
		products = FarMar::Product.all
		
		expect(products.length.must_equal(8193))
		expect(products[0].name.must_equal("Dry Beets"))
		expect(products[279].id.must_equal(280))
		expect(products[8192].vendor_id.must_equal(2690))
	end

	it 'must be able to find objects by id' do
		expect(FarMar::Product.find(31).name.must_equal("Sore Chicken"))
	end
end