require 'nokogiri'
require 'open-uri'

class GvlRomance::Restaurant
    attr_accessor :name, :tip, :location
    @@all = []
    @@name = []

    def initialize(location = nil, name = nil)
        @name = name
        #@tip = tip
        @location = location
        save
    end
    

    def self.all
        GvlRomance::Scraper.restaurant_location if @@all.empty?
        @@all.uniq
    end

    def self.name
        GvlRomance::Scraper.restaurant_name if @@name.empty?
        @@name
        puts @@name
    end

    def save
        @@all << self
    end
end

