# ID - (Fixnum) uniquely identifies the sale
# Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
# Purchase_time - (Datetime) when the sale was completed
# Vendor_id - (Fixnum) a reference to which vendor completed the sale
# Product_id - (Fixnum) a reference to which product was sold

require 'date'

class FarMar::Sale
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
		sales = []
		CSV.foreach("support/sales.csv") do |row|
			if row.length > 0 
				sales << FarMar::Sale.new(row)
			end
		end
		return sales
	end

	def self.find(id)
		sales = all

		sales.each do |sale|
			if sale.id == id
				return sale
			end
		end

		return nil
	end
end