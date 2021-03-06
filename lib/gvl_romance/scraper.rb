require 'nokogiri'
require 'open-uri'

class GvlRomance::Scraper
  @@name = []
  @@list = [] 

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
    @local.clear
  end

  def self.expert_tip(restaurant_input,input)
    @@list.each_with_index do |m,n|
      @name = m
      @index = n+1
      if restaurant_input == @index
        res_name = @name.downcase.gsub("'", '').gsub(" +", '').gsub(' ', '-')
        get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/downtown/restaurants/#{res_name}/")).css(".expert-tips").first.css("li").first.text
        puts "#{@name} TIP: #{get_page}"
      else
        nil
      end
    end
  end

  def self.restaurant_name
    @names=[]
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
    r_name = get_page.css("article#vertical-slideshow h2")
    r_name.each do |n|
      names = n.text.strip
      @names << names
    end
    @names
  end

  def self.name_and_location(input)
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
    name_loc = get_page.css("article#vertical-slideshow div.dt-list-headline")
    uniq_locs = name_loc.each do |a|
      name = a.css("h2").text.strip
      location = a.css("div.dt-neigbhorhood").text.strip
      if input == 1 && location == "Downtown"
        @@name << name
      elsif input == 2 && location == "Simpsonville"
        @@name << name
      elsif input == 3 && location == "Woodruff Road"
        @@name << name
      elsif input == 4 && location == "West Greenville"
        @@name << name
      else
        nil
      end
    end
    @@news = @@name.uniq

    @@list = @@news.each_with_index do |m,n|
      @name = m
      @index = n+1
      puts "- #{@name} (#{@index})"
    end
    puts " "
    puts "choose number next to restaurant name to see an expert's tip!"  
    @@name.clear
  end

end

