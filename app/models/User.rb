class User 

	attr_reader :name

	@@all = []

	def initialize(name)
		@name = name
		@@all << self
	end 

	def self.all 
		@@all 
	end 

	def recipes 
		RecipeCard.all.select do |recipe|
			recipe.user == self 
		end
	end 

	def add_recipe_card(recipe, rating)
		RecipeCard.new(recipe, self, Time.now, rating)
	end 

	def declare_allergy(ingredient)
		Allergy.new(self, ingredient)
	end

	def my_allergens 
		Allergy.all.select do |allergy|
			allergy.user == self 
		end 
	end 

	def allergens 
		self.my_allergens.map do |allergen|
			allergen.ingredient 
		end 
	end 

	def top_three_recipes
		self.recipes.sort_by do |recipe|
			recipe.rating 
		end.last(3)
	end 

	def most_recent_recipe 
		self.recipes.max_by {|recipe| recipe.date}
	end 

	def safe_recipes 


		self.allergens.map do |allergen|
			Recipe.all.select do |recipe|
				!recipe.ingredients.include?(allergen)
			end 
		end.flatten.uniq

	end 

end 