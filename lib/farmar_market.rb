# ID - (Fixnum) a unique identifier for that market
# Name - (String) the name of the market (not guaranteed unique)
# Address - (String) street address of the market
# City - (String) city in which the market is located
# County - (String) county in which the market is located
# State - (String) state in which the market is located
# Zip - (String) zipcode in which the market is located

class FarMar::Market < FarMar::CSV
	attr_accessor :id, :name, :address, :city, :county, :state, :zip, :vendors

	def initialize(arr)
		@id, @name, @address, @city, @county, @state, @zip = arr
		@id = @id.to_i
		@vendors = FarMar::Vendor.by_market(@id)
	end

	def self.all
		return allf("support/markets.csv")
	end

	def self.find(id)
		return findf(id, all)
	end
end