class User

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    self.recipe_cards.collect do |recipe_card|
      recipe_card.recipe
    end
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    ingredients = Allergen.all.collect do |allergen|
      if allergen.user == self
        allergen.ingredient
      end
    end.compact
    ingredients.empty? ? "No Food Allergies - Lucky You" : ingredients
  end

  def top_three_recipes
    if self.recipes.length == 0
      return "You haven't added any recipes"
    elsif self.recipes.length == 1
      return self.recipes
    end

    sorted_recipes = self.recipe_cards.sort_by do |recipe_card|
      recipe_card.rating
    end.reverse.collect do |recipe_card|
      recipe_card.recipe
    end

    sorted_recipes.length == 2 ? sorted_recipes : sorted_recipes[0..2]
  end

  def most_recent_recipe
    self.recipes.length > 0 ? self.recipes[-1] : "You haven't added any recipes"
  end

end
