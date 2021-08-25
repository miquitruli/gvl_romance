require 'nokogiri'
require 'open-uri'

class GvlRomance::Restaurant
    attr_accessor :name, :tip, :location
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

    def self.tip
        GvlRomance::Scraper.expert_tip(restaurant_input)
    end


    def adjusted_name
        adjusted = []
        @last = []
        newest = []
        name=GvlRomance::Scraper.restaurant_name
        name.each do|n|
            names = n.text.strip
            adjusted_name = names.split(" ")
            adjusted << adjusted_name.join("-")
        end
        adjusted.each do|m|
            adjusted_name = m.split("'")
            newest << adjusted_name.join
        end
        newest.each do|x|
            adjusted_name = x.split("+")
            @last << adjusted_name.join
        end
        puts @last
    end

    def save
        @@all << self #each initialize is saved
    end
end

