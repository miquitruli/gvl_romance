require 'nokogiri'
require 'open-uri'

class GvlRomance::Restaurant
    attr_accessor :tip, :location, :name
    
    @@all = [] 
    @@name = [] #restaurant name
    @@location = []
    

    def initialize(name = nil, location = nil)
        @name = name
        @location = location
        @@name << @name
        @@location << @location
        save
    end
    

    def self.location
        GvlRomance::Scraper.restaurant_location if @@location.empty?
        @@location.uniq
    end

    def self.name
        GvlRomance::Scraper.restaurant_name if @@name.empty?
        @@name
    end

    def save
        @@all << self #each initialize is saved
    end
end

