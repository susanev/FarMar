require 'csv'
module FarMar
  class Vendor
    attr_accessor :id, :name, :num_of_employees, :market_id

    def initialize(id, name, num_of_employees, market_id)
      @id = id
      @name = name
      @num_of_employees = num_of_employees
      @market_id = market_id
    end

    def self.all
      info = {}
      CSV.read('../support/products.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        num_of_employees = line[2]
        market_id = line[3]
        info[id] = self.new(id, name, num_of_employees, market_id)
      end
      return info
    end

    def self.find(id)
      return self.all[id]
    end











  end
end
