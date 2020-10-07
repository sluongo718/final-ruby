#keeps track of our drink
#turn our responses into objects
#save all pokemon created


class Meals

    attr_accessor :name, :meal_id, :letter, :instruct

    @@all = []

    def initialize(name:, meal_id:, letter:)
        @name = name
        @meal_id = meal_id
        @letter = letter
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.find_by_letter(letter)
        @@all.select {|m| m.letter == letter}
        
    end

end