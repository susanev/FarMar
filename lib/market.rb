require 'csv'
module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip

    def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      info = {}
      CSV.read('support/markets.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        address = line[2]
        city = line[3]
        county = line[4]
        state = line[5]
        zip = line[6]
        info[id] = self.new(id, name, address, city, county, state, zip)
      end
      return info
    end

    def self.find(id)
      return self.all[id]
    end
  end
end
