class API 

    def self.fetch_meal(letter)
   
        url = "https://www.themealdb.com/api/json/v1/1/search.php?f=#{letter}" 
      
        uri = URI(url)
        #this turns our url in to a uniform Resource Identifier and sets it to a varialble uri
        #which turns it in to  a string of characters that unambiguously identifies a particular resource
        response = Net::HTTP.get(uri)
        
        meals = JSON.parse(response)["meals"]
  

        # the squaare brakets["meals"] will now grab all the values of the key meals
        meals.each do |m|
            
            
           Meals.new(name: m["strMeal"], meal_id: m["idMeal"], letter: letter)   
      
        end
        
    end

    def self.get_meal_info(meal)
        url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal.meal_id}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        me = JSON.parse(response)["meals"][0]
        meal.instruct = me["strInstructions"]

    end

end
