# ID - (Fixnum) uniquely identifies the sale
# Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
# Purchase_time - (Datetime) when the sale was completed
# Vendor_id - (Fixnum) a reference to which vendor completed the sale
# Product_id - (Fixnum) a reference to which product was sold

require 'date'

class FarMar::Sale 
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
		return FarMar::CSV.all("support/sales.csv", FarMar::Sale)
	end

	def self.find(id)
		return FarMar::CSV.find(id, all)
	end
end