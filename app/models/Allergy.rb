class Allergy

	attr_reader :user, :ingredient

	@@all = []

	def initialize(user, ingredient)
		@user = user 
		@ingredient = ingredient
		@@all << self
	end 

	def self.all 
		@@all 
	end 

	def self.get_allergen_ingredients
		self.all.map do |allergy|
			allergy.ingredient
		end
	end 

end 