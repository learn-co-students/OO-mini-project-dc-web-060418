

class User

attr_accessor :name
attr_reader

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end

  # - `User#recipes`
  # should return all of the recipes this user has recipe cards for

  def recipes
    RecipeCard.all.map{|recipe_card| recipe_card.recipe if recipe_card.user == self}.compact
  end

  # - `User#add_recipe_card`
  # should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe

#----------Date must be formated YYYY-DD-MM
  def add_recipe_card(date, rating, recipe_O)
    RecipeCard.new(date, rating, self, recipe_O)
  end

  # - `User#most_recent_recipe`
  # should return the recipe most recently added to the user's cookbook.
#-------Returns an array of all recipe cards for the user
  def find_user_recipe_cards
    RecipeCard.all.map{|rcard| rcard if rcard.user_O == self}.compact

  end
#---------- return most recent based on date: Date formating is Very important see nativly sortable
  def most_recent_recipe
    self.find_user_recipe_cards.sort_by{|rcard| rcard.date}[-1]
  end

  # - `User#top_three_recipes`
  # should return the top three highest rated recipes for this user.

  def top_three_recipes
    self.find_user_recipe_cards.sort_by{|rcard| rcard.rating}.reverse![0..2]
  end


  # - `User#declare_allergen`
  # should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient

  def declare_allergen(ingredient_O)
    Allergen.new(self, ingredient_O)
  end

  # - `User#allergens`
  # should return all of the ingredients this user is allergic to

  def allergens
    Allergen.all.map {|allergen| allergen.ingredient_O if allergen.user_O == self}.compact
  end

  # ### `**Bonus**`
  # - `User#safe_recipes`
  # should return all recipes that do not contain ingredients the user is allergic to
  # - What other methods might be useful to have?

  def safe_recipes
    safe_recipes_array =[]
    #get all the recipies of a user
    all_user_rec = self.recipes
    #get user allergens
    user_allergens = self.allergens
    all_user_rec.each do |recipe|
      y = 0
      recipe.ingredients.each do |ingredient|
        if user_allergens.include?(ingredient)
          y = 1
        end
      end
      safe_recipes_array << recipe if y == 0
    end
    safe_recipes_array

    #return array of recipe objects that are safe

  end







end
