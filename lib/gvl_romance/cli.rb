class GvlRomance::CLI
    
    def call
      puts "Welcome to Greenville!"
      puts "Which romantic location would you like to dine at? select 1-5"
      puts " "
        get_location
        location_list
      puts " "
        input = gets.strip.to_i
        user_location(input)
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

    def user_location(input)
      if input >= 1 && input <= 5
        restaurants_at(input)
      else
        puts "Oh oh! Seems like there was an error, please make a selection of 1-5"
        input = gets.strip.to_i
        location_list
        puts " "
        user_location(input)
      end
    end

    def restaurants_at(input)
      @locations.each_with_index do|location,index|
        selection = index + 1
        if input == selection
          puts "you have chosen to dine at #{location}"
        else
          false
        end
      end
    end

    def random_restaurant
      puts "Don't know which location you would like? Let us choose a random location for you! (y)"
    end
  end