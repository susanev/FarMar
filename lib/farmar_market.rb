# ID - (Fixnum) a unique identifier for that market
# Name - (String) the name of the market (not guaranteed unique)
# Address - (String) street address of the market
# City - (String) city in which the market is located
# County - (String) county in which the market is located
# State - (String) state in which the market is located
# Zip - (String) zipcode in which the market is located

class FarMar::Market
	attr_accessor :id, :name, :address, :city, :county, :state, :zip

	def initialize(arr)
		@id, @name, @address, @city, @county, @state, @zip = arr
		@id = @id.to_i
	end

	def self.all
		markets = []
		CSV.foreach("support/markets.csv") do |row|
			if row.length > 0 
				markets << FarMar::Market.new(row)
			end
		end
		return markets
	end

	def self.find(id)
		markets = all

		markets.each do |market|
			if market.id == id
				return market
			end
		end

		return nil
	end
end