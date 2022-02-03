class ActorsController < ApplicationController
	# index method gets called when the actors URL is requested.
	# index method gets mapped to the actors index.html.erb.
	def index
		# call all method on Actor model class.
		# all method selects all of the data in the actor table
		# and returns the data as an array of obejcts.
		# store the array of objects in an instance variable.
		# instance variable is available to actors index.html.erb.
		@actors = Actor.all
	end

	# new method gets called when the actors/new URL is requested.
	# new method is mapped tot he actors new.html.erb
	def new
	end

	# create method gets called when the Create button is pushed on
	# the actors new.html.erb.
	def create
	end
end
