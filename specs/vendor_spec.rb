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

	it 'must be able to find vendors by market id' do
		vendors = FarMar::Vendor.by_market(1)

		expect(vendors.length.must_equal(6))
		expect(vendors[5].must_equal(FarMar::Vendor.new([6, "Zulauf and Sons", 8, 1])))
	end

	it 'must return Market assoicated with vendor' do
		vendors = FarMar::Vendor.by_market(2)
		market = FarMar::Market.find(2)

		vendors.each do |vendor|
			expect(vendor.market_id.must_equal(market.id))
		end
	end

	it 'must return products associated with vendor' do
		vendor = FarMar::Vendor.find(1)

		vendor.products.each do |product|
			expect(product.vendor_id.must_equal(vendor.id))
		end
	end

	it 'must return sales associated with vendor' do
		vendor = FarMar::Vendor.find(2)
		
		vendor.sales.each do |sale|
			expect(sale.vendor_id.must_equal(vendor.id))
		end
	end

	it 'must calculate revenue of sales correctly' do
		vendor = FarMar::Vendor.find(3)
		expect(vendor.revenue.must_equal(40126))

		vendor = FarMar::Vendor.find(4)
		expect(vendor.revenue.must_equal(26866))
	end

end











