require_relative '../config/environment.rb'

require 'pry'
#------users
bob = User.new("Bob")
jim = User.new("Jim")

#------recipies
beef_stew = Recipe.new("Beef Stew")
chicken_stew = Recipe.new("Chicken Stew")
chicken_soup = Recipe.new("Chicken Soup")

#------ingredients
carrot = Ingredient.new("Carrot")
onion = Ingredient.new("Onion")
chicken = Ingredient.new("Chicken")
beef = Ingredient.new("Beef")

#------RecipeIngredient
w_b_the_beef = [onion, carrot, beef]

beef_stew.add_ingredients(w_b_the_beef)

chicken_stew_i_1 = RecipeIngredient.new(chicken_stew, onion)
chicken_stew_i_2 = RecipeIngredient.new(chicken_stew, carrot)
chicken_stew_i_3 = RecipeIngredient.new(chicken_stew, chicken)


chicken_soup_i_1 = RecipeIngredient.new(chicken_soup, carrot)
chicken_soup_i_2 = RecipeIngredient.new(chicken_soup, chicken)


#----recipe cards
bob.add_recipe_card("2017-05-01", 5, beef_stew)
RecipeCard.new("2018-05-01", 5, jim, chicken_stew)
RecipeCard.new("2016-07-12", 10, bob, chicken_soup)
RecipeCard.new("2018-06-01", 2, jim, chicken_soup)
RecipeCard.new("2018-06-02", 2, jim, chicken_soup)

#-------Allergen

jim.declare_allergen(chicken)
jim.declare_allergen(onion)
bob.declare_allergen(chicken)




binding.pry


puts 'we did it?'
