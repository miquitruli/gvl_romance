require 'nokogiri'
require 'open-uri'

class GvlRomance::Restaurant
    attr_accessor :tip, :location
    attr_reader :name
    @@all = [] 
    @@name = [] #restaurant name
    @@location = []
    

    def initialize(name = nil, location = nil)
        @name = name
        @location = location
        @@name << @name
        @@location << @location
        @tip = tip
        save
    end
    

    def self.location
        GvlRomance::Scraper.restaurant_location if @@location.empty?
        @@location.uniq
    end

    def self.name
       @@name
    end

    def self.tip
        GvlRomance::Scraper.expert_tip(restaurant_input)
    end

    def save
        @@all << self #each initialize is saved
    end
end

