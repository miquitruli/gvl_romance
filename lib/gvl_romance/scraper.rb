require 'nokogiri'
require 'open-uri'

class GvlRomance::Scraper
  attr_accessor :name, :location

  @@n_l = []
  @@name

  def self.restaurant_location
    @local = []
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
    r_name = get_page.css("article#vertical-slideshow div.dt-neigbhorhood")
    uniq_locs = r_name.each do |l|
      locat = l.text.strip
      @local << locat
    end
    local = @local.uniq 
    locations = local << "Travelers Rest"
    locations.each do |location|
      GvlRomance::Restaurant.new(name,location) 
    end
  end

  def self.restaurant_name
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
    r_name = get_page.css("article#vertical-slideshow h2")
    r_name.each do |n|
      name = n.text.strip
      GvlRomance::Restaurant.new(name)
    end
  end

  def self.expert_tip(input)
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/downtown/restaurants/#{location_input}/")).css(".expert-tips").first.css("li").first.text
    puts get_page
  end

  def self.name_and_location(input)
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
    name_loc = get_page.css("article#vertical-slideshow div.dt-list-headline")
    uniq_locs = name_loc.each do |a|
      name = a.css("h2").text.strip
      location = a.css("div.dt-neigbhorhood").text.strip
      if input == 1 && location == "Downtown"
        @@n_l << name
      elsif input == 2 && location == "Simpsonville"
        @@n_l << name
      elsif input == 3 && location == "Woodruff Road"
        @@n_l << name
      elsif input == 4 && location == "West Greenville"
        @@n_l << name
      else
        nil
      end
    end
    @@n_l.each_with_index do |m,n|
      puts "- #{m} (#{n+1})"
    end
  end

  def self.restaurant_display_name
    @@n_l.each_with_index do|a,b|
      puts "#{a} (#{b})"
    end
  end


  def self.adjusted_name
        adjusted = []
        @last = []
        newest = []
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
            adjusted_name = x.split("-+")
            @last << adjusted_name.join
        end
        puts @last
    end
 #def self.name_and_loc
end

