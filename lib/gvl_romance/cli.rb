class GvlRomance::CLI
    
    def call
      puts "Welcome to Greenville!"
      puts "Which romantic location would you like to dine at? select 1-5"
      puts " "
        get_location
        location_list
      puts " "
        user_location
        #random_location
      #restaurants_at(location)
        #restaurant + tip
      #restaurant_info(restaurant)
    end
  
    def get_location
      #scraped locations
      @locations = ["Downtown", "West Greenville", "Simpsonville", "Woodruff", "Travelers Rest"]
    end
  
    def location_list
      #lists locations
      @locations.each_with_index {|location,index|
        puts " - #{location} (#{index+1})"
      }
    end

    def user_location
      location_selected = gets.strip
      location_i = location_selected.to_i
      if location_i >= 1 && location_i <= 5
        true
      else
        false
      end
    end

    def random_restaurant
      puts "Don't know which location you would like? Let us choose a random location for you! (y)"
    end
  end