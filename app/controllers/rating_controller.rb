class RatingController < ApplicationController
	# index method gets called when the rating URL is requested.
	# index method gets mapped to the rating index.html.erb.
	def index
		# call all method on Rating model class.
		# all method selects all of the data in the rating table
		# and returns the data as an array of obejcts.
		# store the array of objects in an instance variable.
		# instance variable is available to rating index.html.erb.
		@rating = Rating.all
		# call all method on Movie model class.
		# all method selects all of the data in the movie table
		# and returns the data as an array of obejcts.
		# store the array of objects in an instance variable.
		# instance variable is available to appearances index.html.erb.
		@movies = Movie.all
		return @movies
	end

	# new method gets called when the rating/new URL is requested.
	# new method is mapped to the rating new.html.erb
	def new
	end
	# create method gets called when the Create button is pushed on
	# the rating new.html.erb.
	def create
		# call constructor of Rating model class giving it the
		# title and rating  paramters input in the actors
		# new.html.erb
		# constructo creates Rating model object which is stored
		# in variable
		rating = Rating.new(rating_params)
		# call save method on Rating object
		# save method inserts the data in the Rating model object
		# into the rating table
		if rating.save
			# if the save method succeeds, request the rating URL
			# which will rendor the rating index.html.erb in the browser
			redirect_to "/rating"
		else
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the rating new.html.erb
			flash[:errors] = rating.errors.full_messages
			# if the save method fails, request the rating/new URL
			# which will rendor the rating new.html.erb in the browser
			redirect_to "/rating/new" 
		end
	end
	# show method gets called when the rating/:id URL is requested
	# show method is mapped to the rating show.html.erb
	def show
		# call find method on Movie model class giving it the id sent
		# in the request
		# find method selects all of the data in the rating table where
		# the id is equal to the id sent in the request 
		# selected data will be returned in an array of movies objects 
		# store the array of actor objects in an instance variable
		# instance variable is availble to rating show.html.erb
		@rating = Rating.find(params[:id]).movies
	end

	# edit method gets called when the rating/:id/edit URL is requested
	# edit method is mapped to the rating edit.html.erb
	def edit
		# call find method on Rating model class giving it the id sent
		# in the request 
		# the find method selects all of the data in the rating table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable will be 
		# available to the edit.html.erb
		@rating = Rating.find(params[:id])
	end

	# update method gets called when the Update button is pushed on the
	# rating edit.html.erb
	def update
		# call find method on Rating model class giving it the id sent in the
		# request
		# find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in a variable
		rating = Rating.find(params[:id])
		# call update method on Movie object giving the first name and
		# last name parameters input in the actors edit.html.erb
		# update method updates the data in the rating table use the parameters
		if rating.update(rating_params)
			# if the update method succeeds, request the movie URL which
			# will render the ratings index.html.erb in the browser
			redirect_to "/rating"
		else
			# if the update method fails, get the full messages associated
			# with the errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the requested URL
			flash[:errors] = ratings.errors.full_messages
			# request the rating/:id/edit URL which will render the ratings
			# edit.html.erb
			redirect_to "/rating/#{rating.id}/edit"
		end
	end

	private
	def rating_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:rating).permit(:title, :rating, :movie_id)
	end
end
