#COMPLETED BY JARED AND ANTHONY

class Ingredient
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end


    def self.most_common_allergen
        highest_ingredient = nil
        highest_num_users = 0

        all_allergens = Allergen.all
        all_ingredients = Ingredient.all

        all_ingredients.each do |ingredient|
            num_users = all_allergens.count do |allergen|
                allergen.ingredient == ingredient
            end
            if num_users > highest_num_users
                highest_num_users = num_users
                highest_ingredient = ingredient
            end
        end
        return highest_ingredient
    end
end
