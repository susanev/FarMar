require_relative 'spec_helper'
require_relative '../far_mar'

describe 'Market::Testing reading from csv' do
	let(:markets) {FarMar::Market.all}
	let(:market_8) {FarMar::Market.find(8)}

	it 'must be able to create objects from csv' do
		# skip
		expect(markets.length.must_equal(500))
		expect(markets[0].name.must_equal("People's Co-op Farmers Market"))
		expect(markets[345].state.must_equal("Missouri"))
		expect(markets[499].address.must_equal("111 E. 210th Street"))
	end

	it 'must be able to find objects by id' do
		# skip
		expect(market_8.name.must_equal("Charlestown Farmers Market"))
	end
end

describe 'Market::Testing vendors instance variable' do
	let(:market) {FarMar::Market.find(2)}

	it 'must have the correct vendors' do
		# skip
		expect(market.vendors.length.must_equal(3))
		expect(market.vendors[1].inspect.must_equal(FarMar::Vendor.new([8,"Stamm Inc",2,2]).inspect))
	end
end

describe 'Market::Testing self.search' do
	let(:school){FarMar::Market.search("schOOl")}
	let(:food){FarMar::Market.search("FOOD")}
	let(:hills){FarMar::Market.search("hills")}

	it 'must return all markets that contain the name' do
		# skip
		expect(school.length.must_equal(3))
		expect(school.map { |market| market.name }.must_equal(["Fox School Farmers Market", "OLD GREGG SCHOOL FARMERS MARKET", "Sassy Pea Market/Good Earth Petting Farm (at The Good Earth Day School)"]))

		expect(food.length.must_equal(4))
		expect(food.map { |market| market.name }.must_equal(["DePere Market at Festival Foods", "East Jerusalem Fresh Food on the Block Farmers Market", "Chapman Food & Fitness Festival", "Mandarin Farmers Market by the Whole Foods Market"]))
	end

	it 'must return all markets and vendors that contain that name' do
		# skip
		expect(hills.length.must_equal(16))
		expect(hills.map { |market| market.name }.must_equal(["Scottdale Farmers Market", "Cheyenne Farmers Market", "Waltham Farmers' Market", "Sandhills Farmers Green Market", "Downtown Valdosta Farm Days", "Davis County Farmers' Market", "El Pueblo Farmers' Market", "Gay Hill Farmer's Market", "Chaparral Farmers' Market", "Chaparral Farmers' Market", "Oxford Original Farmers Market", "Coteau Hills Farmers' Market", "Enid Farmers Market", "Coventry Farmers Market", "Talent Evening Market", "Woodstock Farmers Market"]))
	end
end
