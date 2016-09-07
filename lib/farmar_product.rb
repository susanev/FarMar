# ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product

class FarMar::Product 
	include FarMar::CSV

	attr_accessor :id, :name, :vendor_id

	def initialize(arr)
		@id, @name, @vendor_id = arr
		@id = @id.to_i
		@vendor_id = @vendor_id.to_i
	end

	def self.all
		return FarMar::CSV.all("support/products.csv", FarMar::Product)
	end

	def self.find(id)
		return FarMar::CSV.find(id, all)
	end
end