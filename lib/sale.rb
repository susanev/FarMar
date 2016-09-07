require 'csv'
module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      info = {}
      CSV.read('../support/products.csv').each do |line|
        id = line[0].to_i
        amount = line[1]
        purchase_time = line[2]
        vendor_id = line[3]
        product_id = line[4]
        info[id] = self.new(id, amount, purchase_time, vendor_id, product_id)
      end
      return info
    end

    def self.find(id)
      return self.all[id]
    end
  end
end
