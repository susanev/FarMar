# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends

class FarMar::Vendor
	attr_accessor :id, :name, :num_employees, :market_id

	def initialize(arr)
		@id, @name, @num_employees, @market_id = arr
		@id = @id.to_i
		if @num_employees != nill
			@num_employees = @num_employees.to_i
		end
		if @market_id != nill
			@market_id = @market_id.to_i
		end
	end

	def self.all
		vendors = []
		CSV.foreach("support/vendors.csv") do |row|
			if row.length > 0 
				vendors << FarMar::Vendor.new(row)
			end
		end
		return vendors
	end

	def self.find(id)
		vendors = all

		vendors.each do |vendor|
			if vendor.id == id
				return vendor
			end
		end

		return nil
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
end