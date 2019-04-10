class Recipe

	attr_reader :name

	@@all = []

	def initialize(name)
		@name = name
		@@all << self
	end 

	def self.all 
		@@all 
	end 

	def recipecards

		RecipeCard.all.select do |recipecard|
			recipecard.recipe == self 
		end 
	end 

	def users

		RecipeCard.all.map do |recipecard|
			recipecard.user 
		end 
	end 

	def self.most_popular

		self.all.max_by do |recipe|
			recipe.users.length
		end 
	end 

	def ingredients 
		RecipeIngredient.all.select do |recipe_ingredient|
			recipe_ingredient.recipe == self
		end.map do |recipe_ingredient| 
			recipe_ingredient.ingredient 
		end 
	end 


	def allergens 
		Allergy.get_allergen_ingredients.select do |ingredient|
			 self.ingredients.include?(ingredient)
		end 
	end 

	def add_ingredients(ingredients)
		ingredients.each do |ingredient|
			RecipeIngredient.new(self, ingredient) 
		end
	end  
end 
