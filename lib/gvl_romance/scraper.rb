require 'nokogiri'
require 'open-uri'

class GvlRomance::Scraper
  attr_accessor :name
  #@@locations = []
  #@@name = []
  #@@adjusted_name_for_website = []


  def restaurant_location
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
    r_name = get_page.css("article#vertical-slideshow div.dt-neigbhorhood")
    r_name.each do |l|
      location = l.text.strip
      puts location
    end
  end

  def self.locations
    print @@locations
  end

  def restaurant_name
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
    r_name = get_page.css("article#vertical-slideshow h2")
    r_name.each do |n|
      name = n.text.strip
      puts name
    end
  end

  def expert_tip(location_input)
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/downtown/restaurants/#{location_input}/")).css(".expert-tips").first.css("li").first.text
    puts get_page
  end


end

