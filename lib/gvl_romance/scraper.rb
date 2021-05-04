require 'nokogiri'
require 'open-uri'

class GvlRomance::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/restaurants/romantic-dining/"))
  end

  def restaurant_location
    name = get_page.css(".dt-list-content").first.css(".dt-neigbhorhood").text
    adjusted_name =  name.split(" ").uniq
    adjusted_name[2] = adjusted_name[2] + " " + adjusted_name[3]
    adjusted_name[4] = adjusted_name[4] + " " + adjusted_name[5]
    adjusted_name.pop
    adjusted_name.delete_at(3)
    adjusted_name << "Travelers Rest"
    print adjusted_name
  end

  def restaurant_name
    name = get_page.css(".dt-list-content").first.css("h2").text
    puts name
  end
end

