class FarMar::CSV
	def self.allf(file)
		items = []
		CSV.foreach(file) do |row|
			if row.length > 0 
				items << new(row)
			end
		end
		return items
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