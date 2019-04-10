require_relative '../config/environment.rb'


dan = User.new("Dan")
pudding = Recipe.new("Pudding")
guac = Recipe.new("Guac")
tacos = Recipe.new("Tacos")
pizza = Recipe.new("Pizza")
dan.add_recipe_card(pudding, 4)
dan.add_recipe_card(tacos, 5)
dan.add_recipe_card(guac, 6)
dan.add_recipe_card(pizza, 2)
lige = User.new("Lige")
lige.add_recipe_card(pudding, 3)
spice = Ingredient.new("spice")
sugar = Ingredient.new("sugar")
avocado = Ingredient.new("Avocado")
salt = Ingredient.new("Salt")

guac.add_ingredients([avocado, salt])
recipe_users1 = pudding.users
dans_recipes = dan.recipes 
popular = Recipe.most_popular 
liges_recipes = lige.recipes 
pudding.add_ingredients([spice, sugar])

dan.declare_allergy(spice)
dan.declare_allergy(spice)
dan.declare_allergy(sugar)

pudding.allergens

binding.pry
