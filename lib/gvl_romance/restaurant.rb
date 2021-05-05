require 'nokogiri'
require 'open-uri'

class GvlRomance::Restaurant
    #def get_page
     #   Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/downtown/restaurants/limoncello/"))
    #end

    def expert_tip(input)
        get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/downtown/restaurants/#{input}/")).css(".expert-tips").first.css("li").first.text
        #tip = get_page.css(".expert-tips").first.css("li").first.text
        puts get_page
    end

end

