class Recipe

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end

  # - `Recipe#users`
  # should return the user instances who have recipe cards with this recipe

  def users
    RecipeCard.all.map{|recipe_card| recipe_card.user if recipe_card.recipe_O == self}.compact
  end

  # - `Recipe.most_popular`
  # should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)

  def self.most_popular
    recp_user_number ={}
    self.all.each do |recipe|
      recp_user_number[recipe] = recipe.users.count
    end
    recp_user_number.sort_by{|key, value| value}[-1][0]
  end

  # - `Recipe#ingredients`
  # should return all of the ingredients in this recipe

  def ingredients
    RecipeIngredient.all.map do |reci_ingred|
      reci_ingred.ingredient_O if reci_ingred.recipe_O == self
    end.compact
  end

  # - `Recipe#add_ingredients`
  # should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe

  def add_ingredients(ing_array)
    ing_array.each {|ingredient| RecipeIngredient.new(self, ingredient)}
  end

  # - `Recipe#allergens`
  # should return all of the ingredients in this recipe that are allergens

  def allergens
    self.ingredients.map do |ingredient|
      Allergen.all.map do |allergen|
        ingredient if allergen.ingredient_O == ingredient
      end.compact
    end.flatten.uniq
  end

end
