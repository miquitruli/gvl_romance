require 'nokogiri'
require 'open-uri'

class GvlRomance::Scraper
  attr_accessor :cli
  @@location = []
  @@name = []

  def get_page
    Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
  end

  def restaurant_location
    name = get_page.css(".dt-list-content").first.css(".dt-neigbhorhood").text
    @@location =  name.split(" ").uniq
    @@location[2] = @@location[2] + " " + @@location[3]
    @@location[4] = @@location[4] + " " + @@location[5]
    @@location.pop
    @@location.delete_at(3)
    @@location << "Travelers Rest"
    print @@location
  end

  def self.location
    @@location
  end

  def restaurant_name
    restaurant_names = get_page.css(".dt-list-content").first.css("h2").text
    names =  restaurant_names.split(" ").uniq
    names[1] = names[1] + " " + names[2]
    names[3] = names[3] + " " + names[4] + " " + names[5]
    names[6] = names[6] + " " + names[7] + " " + names[8] + " " + names[9]
    names[10] = names[10] + " " + names[11] 
    names[13] = names[13] + " " + names[14] 
    names[15] = names[15] + " " + names[16] + " " + names[17] + " " + names[18]
    names[20] = names[20] + " " + names[21]
    @@name = names
    @@name.delete_at(2)
    @@name.delete_at(3) && @@name.delete_at(3)
    @@name.delete_at(4) && @@name.delete_at(4) && @@name.delete_at(4)
    @@name.delete_at(5)
    @@name.delete_at(7)
    @@name.delete_at(8) && @@name.delete_at(8) && @@name.delete_at(8)
    @@name.delete_at(10)
    puts @@name
  end

  def expert_tip(input)
    get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/downtown/restaurants/#{input}/")).css(".expert-tips").first.css("li").first.text
    #tip = get_page.css(".expert-tips").first.css("li").first.text
    puts get_page
  end
end

