require_relative '../config/environment.rb'


#COMPLETED BY JARED AND ANTHONY


user1 = User.new
user2 = User.new
user3 = User.new
user4 = User.new

recipe1 = Recipe.new
recipe2 = Recipe.new
recipe3 = Recipe.new
recipe4 = Recipe.new

user1.add_recipe_card("06/04/18", 5, recipe1)
user1.add_recipe_card("07/05/17", 4, recipe3)
user1.add_recipe_card("05/01/16", 3, recipe2)
user1.add_recipe_card("01/17/12", 4, recipe4)
user2.add_recipe_card("05/22/15", 2, recipe2)
user3.add_recipe_card("09/21/16", 4, recipe2)
user3.add_recipe_card("10/10/10", 2, recipe1)

ingredient1 = Ingredient.new
ingredient2 = Ingredient.new
ingredient3 = Ingredient.new
ingredient4 = Ingredient.new

user1.declare_allergen(ingredient1)
user2.declare_allergen(ingredient3)
user1.declare_allergen(ingredient4)
user3.declare_allergen(ingredient3)
user4.declare_allergen(ingredient3)

recipe1.add_ingredients([ingredient1, ingredient2, ingredient4])
recipe2.add_ingredients([ingredient2, ingredient3])

binding.pry
