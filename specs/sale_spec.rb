require_relative 'spec_helper'
require_relative '../far_mar'
require 'date'

describe 'Sale::Testing reading from csv' do
	it 'must be able to create objects from csv' do
		sales = FarMar::Sale.all
		
		expect(sales.length.must_equal(12798))
		expect(sales[0].amount.must_equal(9290))
		expect(sales[279].purchase_time.class.must_equal(DateTime))
		#expect(sales[12797].product_id.must_equal(8192))
	end

	it 'must be able to find objects by id' do
		expect(FarMar::Sale.find(24).amount.must_equal(3776))
	end

	it 'must return associated vendor' do
		expect(FarMar::Sale.find(1).vendor.class.must_equal(FarMar::Vendor))
		expect(FarMar::Sale.find(2).vendor.id.must_equal(1))
		expect(FarMar::Sale.find(9).vendor.id.must_equal(3))
	end

	it 'must return associated product' do
		expect(FarMar::Sale.find(1).product.class.must_equal(FarMar::Product))
		expect(FarMar::Sale.find(2).product.id.must_equal(1))
		expect(FarMar::Sale.find(9).product.id.must_equal(4))
	end

	it 'must return sales in a certain time range' do
		d1 = DateTime.parse("2013-11-06 14:19:49 -0800") #28
		d2 = DateTime.parse("2013-11-12 12:00:35 -0800") #13
		sales = FarMar::Sale.between(d1,d2)
		expect(sales.length.must_equal(10813))

		d3 = DateTime.parse("2013-11-06 06:19:49 -0800") 
		d4 = DateTime.parse("2013-11-06 14:00:35 -0800") 
		sales = FarMar::Sale.between(d3,d4)
		expect(sales.length.must_equal(386))

		d5 = DateTime.parse("2013-11-10 22:36:49 -0800") 
		d6 = DateTime.parse("2013-11-10 22:36:51 -0800") 
		sales = FarMar::Sale.between(d5,d6)
		expect(sales.length.must_equal(1))
	end
end