# ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product

class FarMar::Product #< FarMar::CSV
	include FarMar::CSV
	attr_accessor :id, :name, :vendor_id

	def initialize(arr)
		@id, @name, @vendor_id = arr
		@id = @id.to_i
		@vendor_id = @vendor_id.to_i
	end

	def market
		return FarMar::Vendor.find(vendor_id)
	end

	def sales
		product_sales = []

		FarMar::Sale.all.each do |sale|
			if sale.product_id == id
				product_sales << sale
			end
		end
		return product_sales
	end

	def number_of_sales
		return sales.length
	end

	def self.all
		#return allf("support/products.csv")
		return FarMar::CSV.all("support/products.csv", FarMar::Product)
	end

	def self.find(id)
		#return findf(id, all)
		return FarMar::CSV.find(id, all)
	end

	def self.by_vendor(vendor_id)
		products = []

		all.each do |product|
			if product.vendor_id == vendor_id
				products << product
			end
		end

		return products
	end

	def ==(other_product)
		return @id == other_product.id &&
				@name == other_product.name &&
				@vendor_id == other_product.vendor_id
	end
end