class API 

    def self.fetch_meal(letter)
        #the name and of the method and the argument it passing
        #the argument is the letter that the user passed 
        url = "https://www.themealdb.com/api/json/v1/1/search.php?f=#{letter}" 
        #the is the webpage that we are getting the data on all the meals that start with the letter the user passed in
        uri = URI(url)
        #this turns our url in to a uniform Resource Identifier and sets it to a varialble uri
        #which turns it in to  a string of characters that unambiguously identifies a particular resource
        response = Net::HTTP.get(uri)
        
        #this line takes all the info and turns it into a bunch of strings whick is really hard to look at
        meals = JSON.parse(response)["meals"]
        
        #so now this line above takes the variabble response from the step above and turns it into json view which
        #json is a way more organized view of a hash
        # the squaare brakets["meals"] will now grab all the values of the key meals
        meals.each do |m|
            # m is the variable we set for each meal in tha meals variable
            
           Meals.new(name: m["strMeal"], meal_id: m["idMeal"], letter: letter)   
            #so now here we are going thru each hash in the array of the letter that was inputed and we initiailize
            #the name, id, and letter it belongs to and its now an object in the ruby program
        end
        
    end

    def self.get_meal_info(meal)
        url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal.meal_id}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        me = JSON.parse(response)["meals"][0]
        meal.instruct = me["strInstructions"]
       # me.keys.each do |m|
        #    meal.instrut << me[m] if (m.include?("instrut")) && me[m]
       # end
        #binding.pry
    end

end