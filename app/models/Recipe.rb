#COMPLETED BY JARED AND ANTHONY

class Recipe
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_popular
        all_recipe_cards = RecipeCard.all

        recipe_count_hash = {}


        all_recipe_cards.each do |recipe_card|
            if recipe_count_hash.keys.include?(recipe_card.recipe.to_s)
                recipe_count_hash[recipe_card.recipe.to_s] += 1
            else
                recipe_count_hash[recipe_card.recipe.to_s] = 1
            end
        end
        recipe_count_hash
        highest = recipe_count_hash.first
        recipe_count_hash.each do |key, value|
            if value > highest[1]
                highest[0] = key
                highest[1]= value
            end
        end
        Recipe.all.find do |recipe|
            recipe.to_s == highest[0]
        end
    end

    def users
        RecipeCard.all.map do |recipe_card|
            recipe_card.user if recipe_card.recipe === self
        end.compact
    end

    def add_ingredients(ingredient_arr)
        ingredient_arr.each do |ingredient|
            RecipeIngredient.new(ingredient, self)
        end
    end

    def ingredients
        RecipeIngredient.all.map do |recipe_ingredient|
            recipe_ingredient.ingredient if recipe_ingredient.recipe == self
        end.compact
    end

    def allergens
        allergen_list = Allergen.all.map do |allergen|
            allergen.ingredient
        end

        self.ingredients.map do |ingredient|
            ingredient if allergen_list.include?(ingredient)
        end.compact
    end

  
end