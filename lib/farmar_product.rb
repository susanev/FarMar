# ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product

class FarMar::Product
	attr_accessor :id, :name, :vendor_id

	def initialize(arr)
		@id, @name, @vendor_id = arr
		@id = @id.to_i
		@vendor_id = @vendor_id.to_i
	end

	def self.create_from_file(filename)
		products = []
		CSV.foreach(filename) do |row|
			if row.length > 0 
				products << FarMar::Product.new(row)
			end
		end
		return products
	end
end