# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends

class FarMar::Vendor #< FarMar::CSV
	include FarMar::CSV

	attr_accessor :id, :name, :num_employees, :market_id

	def initialize(arr)
		@id, @name, @num_employees, @market_id = arr
		@id = @id.to_i
		if @num_employees != nil
			@num_employees = @num_employees.to_i
		end
		if @market_id != nil
			@market_id = @market_id.to_i
		end
	end

	def market
		return FarMar::Market.find(@market_id)
	end

	def products
		return FarMar::Product.by_vendor(@id)
	end

	def sales
		vendor_sales = []
		FarMar::Sale.all(:small).each do |sale|
			if sale.vendor_id == @id
				vendor_sales << sale
			end
		end
		return vendor_sales
	end

	def revenue(*args)
		rev_sales = nil
		if args.size == 1
			beg_date = DateTime.parse(args[0])
			end_date = DateTime.parse(args[0] + " 23:59:59")
			rev_sales = FarMar::Sale.between(beg_date, end_date)
		else
			rev_sales = sales
		end

		revenue = 0
		rev_sales.each do |sale|
			revenue+=sale.amount
		end
		return revenue
	end

	def self.all(*args)
		#return allf("support/vendors.csv")
		if args.first == :small
			return FarMar::CSV.all("support/vendors_small.csv", FarMar::Vendor)
		end
		return FarMar::CSV.all("support/vendors.csv", FarMar::Vendor)
	end

	def self.find(id)
		#return findf(id, all)
		return FarMar::CSV.find(id, all)
	end

	def self.by_market(market_id)
		markets = []
		vendors = all

		vendors.each do |vendor|
			if vendor.market_id == market_id
				markets << vendor
			end
		end

		return markets
	end

	def self.revenue(date)
		revenue = 0
		all.each do |vendor|
			revenue += vendor.revenue(date)
		end
		return revenue
	end

	def self.most(type, n)
		if n < 1
			raise ArgumentError.new("value must be greater than 0")
		end
		all_vendors = all(:small)
		most = [all_vendors.pop]

		all_vendors.each do |vendor|
			if vendor.compare(type, most.first) > 0
				most.insert(0, vendor)
			elsif vendor.compare(type, most.last) < 0
				most.push(vendor)
			else
				min = 0
				max = most.length
				mid = (min+max)/2

				while (max - min) > 1
					if vendor.compare(type, most[mid]) > 0
						max = mid
					else
						min = mid
					end
					mid = (min+max)/2
				end
				most.insert(mid+1, vendor)
			end

			if most.length > n
				most.pop
			end
		end

		return most
	end

	def self.most_revenue(n)
		most(:revenue, n)
	end

	def self.most_items(n)
		most(:items_sold, n)
	end

	def inspect
		"id: #{@id} name: #{@name} num employees: #{@num_employees} market id: #{@market_id}"
	end

	def ==(other_vendor)
		return @id == other_vendor.id &&
				@name == other_vendor.name &&
				@num_employees == other_vendor.num_employees
	end

	def compare(type, another_vendor)
		if type == :revenue
			a = self.revenue
			b = another_vendor.revenue
		elsif type == :items_sold
			a = self.sales.length
			b = another_vendor.sales.length
		end

	    if a < b
	    	return -1
	    elsif a > b
	    	return 1
	    else
	    	return 0
	    end
	end
end










