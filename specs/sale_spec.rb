require_relative 'spec_helper'
require_relative '../far_mar'
require 'date'

describe 'Sale::Testing reading from csv' do
	it 'must be able to create objects from csv' do
		products = FarMar::Sale.all
		
		expect(products.length.must_equal(12798))
		expect(products[0].amount.must_equal(9290))
		expect(products[279].purchase_time.class.must_equal(DateTime))
		#expect(products[12797].product_id.must_equal(8192))
	end

	it 'must be able to find objects by id' do
		expect(FarMar::Sale.find(24).amount.must_equal(3776))
	end
end