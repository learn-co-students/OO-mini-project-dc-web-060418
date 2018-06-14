

class RecipeCard
  attr_accessor :date, :rating, :user_O, :recipe_O

  @@all = []

  def self.all
    @@all
  end
#----------Date must be formated YYYY-DD-MM
  def initialize(date, rating, user_O, recipe_O)
    @date = date
    @rating = rating
    @user_O = user_O
    @recipe_O = recipe_O
    self.class.all << self
  end

#  - `RecipeCard#user`
 # should return the user to which the entry belongs
 def user
   self.user_O
 end
 # - `RecipeCard#recipe`
 # should return the recipe to which the entry belongs

 def recipe
   self.recipe_O
 end

end
