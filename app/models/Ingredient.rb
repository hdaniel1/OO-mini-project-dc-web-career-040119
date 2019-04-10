class Ingredient

	attr_reader :name

	@@all = []

	def initialize(name)
		@name = name
		@@all << self
	end 

	def self.all 
		@@all 
	end 

	def ingredient_allergies
		Allergy.all.select do |allergy|
			allergy.ingredient == self 
		end 
	end 
	
	def self.most_common_allergen
		self.all.max_by do |ingredient|
			ingredient.ingredient_allergies.length 
		end 
	end 
end 
