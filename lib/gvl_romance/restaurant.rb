require 'nokogiri'
require 'open-uri'

class GvlRomance::Restaurant
    attr_accessor :name, :tip, :location
    @@all = []

    def initialize(location)
        #@name = name
        #@tip = tip
        @location = location
        save
    end
    

    def self.all
        GvlRomance::Scraper.restaurant_location if @@all.empty?
        @@all.uniq
    end

    def save
        @@all << self
    end
end

