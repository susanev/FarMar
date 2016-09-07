module FarMar::CSV
	def self.all(file, item_type)
		items = []
		CSV.foreach(file) do |row|
			if row.length > 0 
				items << item_type.new(row)
			end
		end
		return items
	end

	def self.find(id, items)
		items.each do |item|
			if item.id == id
				return item
			end
		end

		return nil
	end
end