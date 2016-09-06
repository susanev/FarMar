# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends

class FarMar::Vendor
	attr_accessor :id, :name, :num_employees, :market_id

	def initialize(arr)
		@id, @name, @num_employees, @market_id = arr
		@num_employees = @num_employees.to_i
	end

	def self.create_from_file(filename)
		vendors = []
		CSV.foreach(filename) do |row|
			if row.length > 0 
				vendors << FarMar::Vendor.new(row)
			end
		end
		return vendors
	end

end