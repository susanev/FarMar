# ID - (Fixnum) a unique identifier for that market
# Name - (String) the name of the market (not guaranteed unique)
# Address - (String) street address of the market
# City - (String) city in which the market is located
# County - (String) county in which the market is located
# State - (String) state in which the market is located
# Zip - (String) zipcode in which the market is located

class FarMar::Market #< FarMar::CSV
	include FarMar::CSV
	attr_accessor :id, :name, :address, :city, :county, :state, :zip

	def initialize(arr)
		@id, @name, @address, @city, @county, @state, @zip = arr
		@id = @id.to_i
	end

	def vendors
		return FarMar::Vendor.by_market(@id)
	end

	def products
		products = []
		vendors = FarMar::Vendor.by_market(@id)

		vendors.each do |vendor|
			products << vendor.products
		end

		return products
	end

	def prefered_vendor
		all_vendors = vendors
		pref_vendor = all_vendors.pop

		all_vendors.each do |vendor|
			if vendor.revenue > pref_vendor.revenue
				pref_vendor = vendor
			end
		end

		return pref_vendor
	end

	def prefered_vendor(date)
		all_vendors = vendors
		pref_vendor = all_vendors.pop
		
		all_vendors do |vendor|
			if vendor.revenue(date) > pref_vendor.revenue(date)
				pref_vendor = vendor
			end
		end

		return pref_vendor
	end

	def worst_vendor
		all_vendors = vendors
		worst_vendor = all_vendors.pop

		all_vendors.each do |vendor|
			if vendor.revenue < worst_vendor.revenue
				worst_vendor = vendor
			end
		end

		return worst_vendor
	end

	def worst_vendor
		all_vendors = vendors
		worst_vendor = all_vendors.pop

		all_vendors.each do |vendor|
			if vendor.revenue(date) < worst_vendor.revenue(date)
				worst_vendor = vendor
			end
		end

		return worst_vendor
	end

	def self.all
		#return allf("support/markets.csv")
		return FarMar::CSV.all("support/markets.csv", FarMar::Market)
	end

	def self.find(id)
		#return findf(id, all)
		return FarMar::CSV.find(id, all)
	end

	def self.search(search_term)
		markets = []
		all.each do |market|
			if market.name.include? search_term
				markets << market
			else
				market.vendors.each do |vendor|
					if vendor.name.include? search_term
						markets << market
					end
				end
			end
		end

		return markets
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