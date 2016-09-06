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
	end

	def self.create_from_file(filename)
		markets = []
		CSV.foreach(filename) do |row|
			if row.length > 0 
				markets << FarMar::Market.new(row)
			end
		end
		return markets
	end
end