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
end