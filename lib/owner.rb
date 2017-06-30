require 'pry'

class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

	def initialize(species)
		@species = species
		@@all << self
		@pets = {
			fishes: [],
			dogs: [],
			cats: []
		}
	end

	def say_species
		"I am a #{@species}."
	end

	def buy_fish(fish)
		@pets[:fishes] << Fish.new(fish)
	end

	def buy_dog(dog)
		@pets[:dogs] << Dog.new(dog)
	end

	def buy_cat(cat)
		@pets[:cats] << Cat.new(cat)
	end

	def self.all
		@@all
	end

	def self.reset_all
		@@all = []
	end

	def self.count
		@@all.length
	end

	def walk_dogs
		@pets[:dogs].map{|dog| dog.mood = 'happy'}
	end

	def play_with_cats
		@pets[:cats].map{|cat| cat.mood = 'happy'}
	end

	def feed_fish
		@pets[:fishes].map{|fish| fish.mood = 'happy'}
	end

	def sell_pets
		@pets.values.each do |pet_list|
			until pet_list == []
				pet_list.pop.mood = 'nervous'
			end
		end
	end

	def list_pets
		"I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
	end

end