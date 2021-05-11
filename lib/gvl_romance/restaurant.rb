require 'nokogiri'
require 'open-uri'

class GvlRomance::Restaurant
    attr_accessor :name, :tip, :location
    @@all = []

    def initialize(name)
        @name = name
        #@tip = tip
        #@location = location
        @@all << self
    end
    

    def self.all
        GvlRomance::Scraper.restaurant_name if @@all.empty?
        @@all
    end

    

end

