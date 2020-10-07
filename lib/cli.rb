#interactions with user
# contain all of our gets and puts
#control flow of our program

class CLI 

    def start
        # intro
        # search for recipe by letter
        # searching for instructions by  meal

        # do it again?   
        puts ""
        puts "Hi and Welcome to the Meal finder!"
        puts ""
        intro
        user_in = gets.strip.downcase

        while user_in != 'exit' do 
            
            if user_in.to_i > 0 && user_in.to_i <=  Meals.find_by_letter(@letter).length
                meal = Meals.find_by_letter(@letter)[user_in.to_i - 1] 
                
                API.get_meal_info(meal) if !meal.instruct

                
                print_single_meal_info(meal)
                

                
            elsif   user_in == 'meal'
                    lets_start_over
                   

            else
                puts ""
                puts "sry i did not understand that"
                puts ""
            
            end
                 puts "please enter another number from the list to get info on that meal or enther 'meal' to look for a new list "
                user_in = gets.strip.downcase
                puts ""


                
            
                
        end


       puts ""
        puts "goodbye"
        puts ""
    end

    def print_meal(me)
        #this method prints out a list of all the meals that start with the letter that was passed in as the argument
        puts ""
        puts "Here are all the Meals I have starting with the letter #{@letter}"
        puts ""
        me.each_with_index do |d, i|
            puts "#{i +1}. #{d.name}"

        end
    end

    def print_single_meal_info(meal)
        #this method will return the name and details of the meal that is passed in as its Argument
        puts ""
        puts""
        puts  meal.name
        puts ""
        puts meal.instruct
        puts ""

    end

    def lets_start_over
        puts ""
        puts "Did you want to look for another list by the letter again?"
        puts ""
        puts "go ahead and type in another letter to get a new list!!! or type exit to exit"
        @letter = gets.strip.downcase
        puts ""
        
        if Meals.find_by_letter(@letter).length > 0
            meals = Meals.find_by_letter(@letter)
            puts ""
            print_meal(meals)
        else
            API.fetch_meal(@letter)
            
            puts ""
            meals = Meals.find_by_letter(@letter)
            puts ""
            print_meal(meals)

        end
        #API.fetch_meal(@letter)
        puts ""
        #meals = Meals.find_by_letter(@letter)
        puts ""
        #print_meal(meals)
 
        

    end



    def intro
        puts "Tired of eating the same meals? type a letter and I'll give you a list of new Meal Ideas!!!"
        puts ""
        
        alpha = ("a".."z").to_a
        @letter = gets.strip.downcase
        puts ""
        while !alpha.include?(@letter)
            puts "Invalid please enter a letter"
            @letter = gets.strip.downcase
        end 

        API.fetch_meal(@letter)
        
        puts ""
        meals = Meals.all
        print_meal(meals)
        
        puts ""
        puts "Type a number listed to see more details or type 'meal' for another chance to look at list of meals by letter or type 'exit' to exit"
    end

end