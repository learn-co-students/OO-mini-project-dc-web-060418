class RecipeIngredient

  attr_accessor :recipe_O, :ingredient_O

  @@all = []

  def self.all
    @@all
  end

  def initialize(recipe_O, ingredient_O)

    @recipe_O = recipe_O
    @ingredient_O = ingredient_O
    self.class.all << self
  end
  # - `RecipeIngredient#ingredient`
  # should return the ingredient instance
    def ingredient
      self.ingredient_O
    end
    # - `RecipeIngredient#recipe`
    # should return the recipe instance
    def recipe
      self.recipe_O
    end


end
