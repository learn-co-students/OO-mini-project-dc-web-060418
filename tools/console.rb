require_relative '../config/environment.rb'

recipe1 = Recipe.new("Chicken Soup")
recipe2 = Recipe.new("Pizza")
recipe3 = Recipe.new("Pasta")
recipe4 = Recipe.new("Sushi")

user1 = User.new("Paul")
user2 = User.new("Morgan")
user3 = User.new("Melanie")

ingredient1 = Ingredient.new("Tomato")
ingredient2 = Ingredient.new("Chicken")



user1.add_recipe_card(recipe2, "6/13/18", 8)
user1.add_recipe_card(recipe3, "6/11/18", 6)
user2.add_recipe_card(recipe1, "6/15/18", 7)
user1.add_recipe_card(recipe4, "6/12/18", 10)
user1.add_recipe_card(recipe1, "6/14/18", 9)

user2.declare_allergen(ingredient1)
user2.declare_allergen(ingredient2)
user1.declare_allergen(ingredient1)

recipe1.add_ingredients([ingredient1, ingredient2])




binding.pry

puts("")
