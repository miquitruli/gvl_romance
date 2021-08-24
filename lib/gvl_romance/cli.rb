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
        

        #restaurants_at(input)
        #restaurant + tip
      #restaurant_info(restaurant)
    end
  
    def get_location #method collects location
      #scraped locations
      @locations = GvlRomance::Restaurant.location
    end
  
    def location_list #method displays location list with index + 1 so customer can select
      @locations.each_with_index {|l,index|
        puts " - #{l} (#{index+1})"
      }
    end

    def user_location(input) #collects user's inputs and validates if valid input #tells customer which location they have selected
      if input >= 1 && input <= 5
        chosen_location(input)
        #testing(input)
        puts " "
        puts "GREAT CHOICE! Here are the best romantic restaurants at that location:"
        puts " "
        displayed_restaurant(input)
        puts " "
        puts "choose number next to restaurant name to see an expert's tip! "
        puts " "
      else
        puts "Oh oh! Seems like there was an error, please make a selection of 1-5"
        input = gets.strip.to_i
        location_list
        puts " "
        user_location(input)
      end
    end

    def chosen_location(input) #used in user_location method. Translated the customer's input and tells customer what location they have selected
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

    #def printed_restaurant_location
     # name = GvlRomance::Scraper.name_and_location
      #@locations = GvlRomance::Restaurant.all
    #end

    def displayed_restaurant(input)
      if input >0 && input<5
        @restaurant = GvlRomance::Scraper.name_and_location(input)
      elsif input == 5
        puts "- Restaurant 17 (1)"
      else
        nil
      end
    end

  end