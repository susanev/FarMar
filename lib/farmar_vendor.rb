# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends

class FarMar::Vendor #< FarMar::CSV
	include FarMar::CSV
	attr_accessor :id, :name, :num_employees, :market_id

	def initialize(arr)
		@id, @name, @num_employees, @market_id = arr
		@id = @id.to_i
		if @num_employees != nil
			@num_employees = @num_employees.to_i
		end
		if @market_id != nil
			@market_id = @market_id.to_i
		end
	end

	def market
		return FarMar::Market.find(@market_id)
	end

	def products
		return FarMar::Product.by_vendor(@id)
	end

	def self.all
		#return allf("support/vendors.csv")
		return FarMar::CSV.all("support/vendors.csv", FarMar::Vendor)
	end

	def self.find(id)
		#return findf(id, all)
		return FarMar::CSV.find(id, all)
	end

	def self.by_market(market_id)
		markets = []
		vendors = all

		vendors.each do |vendor|
			if vendor.market_id == market_id
				markets << vendor
			end
		end

		return markets
	end

	def inspect
		"id: #{@id} name: #{@name} num employees: #{@num_employees} market id: #{@market_id}"
	end

	def ==(other_vendor)
		return @id == other_vendor.id &&
				@name == other_vendor.name &&
				@num_employees == other_vendor.num_employees
	end
end










