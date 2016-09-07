require_relative 'spec_helper'
require_relative '../far_mar'

describe 'Market::Testing reading from csv' do
	it 'must be able to create objects from csv' do
		markets = FarMar::Market.all
		
		expect(markets.length.must_equal(500))
		expect(markets[0].name.must_equal("People's Co-op Farmers Market"))
		expect(markets[345].state.must_equal("Missouri"))
		expect(markets[499].address.must_equal("111 E. 210th Street"))
	end

	it 'must be able to find objects by id' do
		expect(FarMar::Market.find(8).name.must_equal("Charlestown Farmers Market"))
	end
end

describe 'Market::Testing vendors instance variable' do
	it 'must have the correct vendors' do
		market = FarMar::Market.find(2)

		expect(market.vendors.length.must_equal(3))
		expect(market.vendors[1].inspect.must_equal(FarMar::Vendor.new([8,"Stamm Inc",2,2]).inspect))
	end
end
