require_relative 'spec_helper'
require_relative '../far_mar'

describe 'Testing basic setup' do
	it 'must be able to create base objects' do
		expect(FarMar::Market.new.class.must_equal(FarMar::Market))
		expect(FarMar::Vendor.new.class.must_equal(FarMar::Vendor))
		expect(FarMar::Product.new.class.must_equal(FarMar::Product))
		expect(FarMar::Sale.new.class.must_equal(FarMar::Sale))
	end
end