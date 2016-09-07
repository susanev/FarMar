class FarMar::CSV
	def self.allf(file)
		markets = []
		CSV.foreach(file) do |row|
			if row.length > 0 
				markets << new(row)
			end
		end
		return markets
	end

	def self.findf(id, items)
		items.each do |item|
			if item.id == id
				return item
			end
		end

		return nil
	end
end