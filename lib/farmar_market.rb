# ID - (Fixnum) a unique identifier for that market
# Name - (String) the name of the market (not guaranteed unique)
# Address - (String) street address of the market
# City - (String) city in which the market is located
# County - (String) county in which the market is located
# State - (String) state in which the market is located
# Zip - (String) zipcode in which the market is located

class FarMar::Market #< FarMar::CSV
	include FarMar::CSV
	attr_accessor :id, :name, :address, :city, :county, :state, :zip, :vendors

	def initialize(arr)
		@id, @name, @address, @city, @county, @state, @zip = arr
		@id = @id.to_i
		@vendors = FarMar::Vendor.by_market(@id)
	end

	def self.all
		#return allf("support/markets.csv")
		return FarMar::CSV.all("support/markets.csv", FarMar::Market)
	end

	def self.find(id)
		#return findf(id, all)
		return FarMar::CSV.find(id, all)
	end

	def ==(other_market)
		return @id == other_market.id &&
				@name == other_market.name &&
				@address == other_market.address &&
				@city == other_market.city &&
				@county == other_market.county &&
				@state == other_market.state &&
				@zip == other_market.zip &&
				@vendors == other_market.vendors
	end
end