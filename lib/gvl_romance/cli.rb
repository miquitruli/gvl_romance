class GvlRomance::CLI
    
    def call
      puts "Welcome to Greenville!"
      puts "Which romantic location would you like to dine at? select 1-5"
      puts " "
        get_location #method collects location
        location_list #method displays location list with index + 1 so customer can select
      puts " "
        input = gets.strip.to_i #user's input
        user_location(input) #collects user's inputs and validates if valid input #tells customer which location they have selected
        #printed_restaurant_location
        displayed_restaurant(input)
        #restaurants_at(input)
        #restaurant + tip
      #restaurant_info(restaurant)
    end
  
    def get_location #method collects location
      #scraped locations
      @locations = GvlRomance::Restaurant.all
    end
  
    def location_list #method displays location list with index + 1 so customer can select
      @locations.each_with_index {|l,index|
        puts " - #{l.location} (#{index+1})"
      }
    end

    def user_location(input) #collects user's inputs and validates if valid input #tells customer which location they have selected
      if input >= 1 && input <= 5
        chosen_location(input)
        #testing(input)
        puts " "
        puts "GREAT CHOICE! Here are the best romantic restaurants at that location:"
        puts " "
        puts "PSSSSSST, we also included an expert's tip to help you with your restaurant choice!"
        puts " "
      else
        puts "Oh oh! Seems like there was an error, please make a selection of 1-5"
        input = gets.strip.to_i
        location_list
        puts " "
        user_location(input)
      end
    end

    def random_restaurant
      puts "Don't know which location you would like? Let us choose a random location for you! (y)"
    end

    def printed_restaurant_location
      name = GvlRomance::Scraper.name_and_location
      #@locations = GvlRomance::Restaurant.all
    end

    def displayed_restaurant(input)
        GvlRomance::Scraper.name_and_location(input)
    end
  end