require 'csv'
module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      info = {}
      CSV.read('../support/products.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        vendor_id = line[2]

        info[id] = self.new(id, name, vendor_id)
      end
      return info
    end

    def self.find(id)
      return self.all[id]
    end
  end
end
