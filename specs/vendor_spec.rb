require_relative 'spec_helper'
require_relative '../far_mar'

describe 'Vendor::Testing reading from csv' do
	it 'must be able to create objects from csv' do
		vendors = FarMar::Vendor.all
		
		expect(vendors.length.must_equal(2690))
		expect(vendors[0].name.must_equal("Feil-Farrell"))
		expect(vendors[279].num_employees.must_equal(7))
		expect(vendors[2689].market_id.must_equal(500))
	end

	it 'must be able to find objects by id' do
		expect(FarMar::Vendor.find(15).name.must_equal("Hyatt-King"))
	end
end