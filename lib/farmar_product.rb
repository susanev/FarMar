# ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product

class FarMar::Product < FarMar::CSV
	attr_accessor :id, :name, :vendor_id

	def initialize(arr)
		@id, @name, @vendor_id = arr
		@id = @id.to_i
		@vendor_id = @vendor_id.to_i
	end

	def self.all
		return allf("support/products.csv")
	end

	def self.find(id)
		return findf(id, all)
	end
end