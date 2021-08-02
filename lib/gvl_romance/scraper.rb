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
      name = n.text.strip
      GvlRomance::Restaurant.new(name)
    end
  end

  def expert_tip(location_input)
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/downtown/restaurants/#{location_input}/")).css(".expert-tips").first.css("li").first.text
    puts get_page
  end

  def self.name_and_location(input)
    @n_l = []
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
    name_loc = get_page.css("article#vertical-slideshow div.dt-list-headline")
    uniq_locs = name_loc.each do |a|
      name = a.css("h2").text.strip
      location = a.css("div.dt-neigbhorhood").text.strip
      if input == 1 && location == "Downtown"
        @n_l << name
      elsif input == 2 && location == "Simpsonville"
        @n_l << name
      elsif input == 3 && location == "Woodruff Road"
        @n_l << name
      elsif input == 4 && location == "West Greenville"
        @n_l << name
      elsif input == 5
        @n_l = "Restaurant 17"
      else
        nil
      end
    end
    puts @n_l
  end
end

