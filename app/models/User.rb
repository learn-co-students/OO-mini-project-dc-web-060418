#COMPLETED BY JARED AND ANTHONY

class User
    @@all = []


    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def add_recipe_card(date, rating, recipe)
        RecipeCard.new(date, rating, self, recipe)
    end

    def recipes
        RecipeCard.all.map do |recipe_card|
            recipe_card.recipe if recipe_card.user == self
        end.compact
    end

    

    def top_three_recipes
        user_recipe_cards = RecipeCard.all.keep_if do |recipe_card|
            recipe_card.user == self
        end

        sorted_recipe_cards = user_recipe_cards.sort  { |a, b| b.rating <=> a.rating}

        sorted_recipe_cards[0..2].map do |recipe_card|
            recipe_card.recipe
        end
    end


  

    def most_recent_recipe
        user_recipe_cards = RecipeCard.all.keep_if do |recipe_card|
            recipe_card.user == self
        end

        most_recent_card = user_recipe_cards[0]

        user_recipe_cards.each do |recipe_card|
            if recipe_card.date[:year] > most_recent_card.date[:year]
                most_recent_card = recipe_card
            elsif recipe_card.date[:year] == most_recent_card.date[:year]
                if recipe_card.date[:month] > most_recent_card.date[:month]
                    most_recent_card = recipe_card
                elsif recipe_card.date[:month] == most_recent_card.date[:month]
                    if recipe_card.date[:day] > most_recent_card.date[:day]
                        most_recent_card = recipe_card
                    end
                end
            end
        end
        return most_recent_card.recipe
    end

    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end

    def allergens
        Allergen.all.map do |allergen|
            allergen.ingredient if allergen.user == self
        end.compact
    end

    def is_safe?(recipe)
        user_allergens = self.allergens

        recipe.ingredients.each do |ingredient|
            if user_allergens.include?(ingredient)
                return false
            end
        end
        true
    end

    def safe_recipes
        Recipe.all.map do |recipe|
            recipe if is_safe?(recipe)
        end.compact
    end

end