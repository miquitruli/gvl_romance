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
        restaurant_input = gets.strip.to_i
        restaurant_tip(restaurant_input,input)
      puts " "
      puts "Still not sure where to go?? Let's make this fun and allow us to make a random selection for you!(7)"
      puts " "
      puts "OR select (1) to start all over. Otherwise, select (9) to end!"
      puts " "
        random_input = gets.strip.to_i
        random_restaurant(random_input)
    end
  
    def get_location #method collects location/ scraped locations
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

    def displayed_restaurant(input) #once user selects location, restaurants in that location are displayed
      if input >0 && input<5
        
        @restaurant = GvlRomance::Scraper.name_and_location(input)
      elsif input == 5
        puts "- Restaurant 17 (1)"
      else
        nil
      end
    end

    def restaurant_tip(restaurant_input,input) #user selects location and restaurant and a tip is displayed
      if input == 5 && restaurant_input == 1
        puts "Restaurant 17 TIP: #{get_page = Nokogiri::HTML(open("https://www.10best.com/destinations/south-carolina/greenville/downtown/restaurants/restaurant-17/")).css(".expert-tips").first.css("li").first.text}"
      else 
        tip = GvlRomance::Scraper.expert_tip(restaurant_input,input)
      end
    end  

    def random_restaurant(random_input)
      if random_input == 7
        @name = GvlRomance::Scraper.restaurant_name
        @random_name = @name.sample
        puts " You are going to #{@random_name}!"
        puts " "
        puts "Hope you enjoy our pick! GOODBYE!!"
        puts " "  
        puts "Want to start over? (1) exit? (2)"
        new_input = gets.strip.to_i
        continue(new_input)
      elsif random_input == 1
        start_over
      elsif random_input == 9
        puts "Thank you for allowing us to choose a romantic place for you to dine at. BYE BYE!!" 
      else
        nil
      end
    end

    def start_over
      call
    end

    def continue(new_input)
      if new_input == 1
        start_over
      elsif new_input == 2
        puts "Thank you for allowing us to choose a romantic place for you to dine at. BYE BYE!!"
      else
        puts "Oh oh! Seems like there was an error, please make a selection of (1/2)"
        new_input = gets.strip.to_i
      end
    end
  end