# class FarMar::CSV
module FarMar::CSV
	#def self.allf(file)
	def self.all(file, item_type)
		items = []
		CSV.foreach(file) do |row|
			if row.length > 0 
				#items << new(row)
				items << item_type.new(row)
			end
		end
		return items
	end

	#def self.findf(id, items)
	def self.find(id, items)
		items.each do |item|
			if item.id == id
				return item
			end
		end

		return nil
	end
end