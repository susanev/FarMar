# ID - (Fixnum) uniquely identifies the sale
# Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
# Purchase_time - (Datetime) when the sale was completed
# Vendor_id - (Fixnum) a reference to which vendor completed the sale
# Product_id - (Fixnum) a reference to which product was sold

require 'date'

class FarMar::Sale #< FarMar::CSV
	include FarMar::CSV
	attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

	def initialize(arr)
		@id, @amount, @purchase_time, @vendor_id, @product_id = arr
		@id = @id.to_i
		@amount = @amount.to_f
		@purchase_time = DateTime.parse(@purchase_time)
		@vendor_id = @vendor_id.to_i
		@product_id = @product_id.to_i
	end

	def self.all
		#return allf("support/sales.csv")
		return FarMar::CSV.all("support/sales.csv", FarMar::Sale)
	end

	def self.find(id)
		#return findf(id, all)
		return FarMar::CSV.find(id, all)
	end

	def vendor
		return FarMar::Vendor.find(@vendor_id)
	end

	def product
		return FarMar::Product.find(@product_id)
	end

	def self.between(beg_time, end_time)
		sales = []
		all.each do |sale|
			time = sale.purchase_time.strftime("%H:%M")
			if  time > beg_time && time < end_time
				sales << sale
			end
		end
	end
end