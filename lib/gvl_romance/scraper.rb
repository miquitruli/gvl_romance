require 'nokogiri'
require 'open-uri'

class GvlRomance::Scraper
  attr_accessor :name, :location
  #@@locations = []
  #@@name = []
  #@@adjusted_name_for_website = []


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
      GvlRomance::Restaurant.new(location) 
    end
  end

  def self.restaurant_name
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
    r_name = get_page.css("article#vertical-slideshow h2")
    r_name.each do |n|
      names = n.text.strip
      name = names.uniq
      GvlRomance::Restaurant.new(name)
    end
  end

  def self.expert_tip(location_input)
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/downtown/restaurants/#{location_input}/")).css(".expert-tips").first.css("li").first.text
    puts get_page
  end
end

