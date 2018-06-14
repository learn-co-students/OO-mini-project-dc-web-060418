class Recipe

    attr_accessor :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.most_popular
  
      self.all.empty? ? "No Recipes Yet" :
  
      self.all.sort_by do |recipe|
        recipe.recipe_cards.length
      end[-1]
    end
  
    def recipe_cards
      RecipeCard.all.select do |recipe_card|
        recipe_card.recipe == self
      end
    end
  
    def users
      self.recipe_cards.collect do |recipe_card|
        recipe_card.user
      end
    end
  
    def recipe_ingredient
      RecipeIngredient.all.select do |recipe_ingredient|
        recipe_ingredient.recipe == self
      end
    end
  
    def ingredients
      self.recipe_ingredient.collect do |recipe_ingredient|
        recipe_ingredient.ingredient
      end
    end
  
    def allergens
      self.ingredients.collect do |ingredient|
        ingredient.allergens
      end 
    end
  
    def add_ingredients(arr)
      arr.each do |ingredient|
        RecipeIngredient.new(ingredient, self)
      end
    end
  
  end