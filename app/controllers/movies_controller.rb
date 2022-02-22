class MoviesController < ApplicationController
	# index method gets called when the movies URL is requested.
	# index method gets mapped to the movies index.html.erb.
	def index
		# call all method on Movie model class.
		# all method selects all of the data in the movie table
		# and returns the data as an array of obejcts.
		# store the array of objects in an instance variable.
		# instance variable is available to movies index.html.erb.
		@movies = Movie.all
	end

	# new method gets called when the movies/new URL is requested.
	# new method is mapped to the movies new.html.erb
	def new
	end
	# create method gets called when the Create button is pushed on
	# the movies new.html.erb.
	def create
		# call constructor of Movie model class giving it the
		# title, duration, rating, and release_date paramters input in the actors
		# new.html.erb
		# constructo creates Movie model object which is stored
		# in variable
		movie = Movie.new(movie_params)
		# call save method on Movie object
		# save method inserts the data in the Movie model object
		# into the movie table
		if movie.save
			# if the save method succeeds, request the movies URL
			# which will rendor the movies index.html.erb in the browser
			redirect_to "/movies"
		else
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the movie new.html.erb
			flash[:errors] = movie.errors.full_messages
			# if the save method fails, request the movies/new URL
			# which will rendor the actors new.html.erb in the browser
			redirect_to "/movies/new" 
		end
	end
	# show method gets called when the movies/:id URL is requested
	# show method is mapped to the movies show.html.erb
	def show
		# call find method on Movie model class giving it the id sent
		# in the request
		# find method selects all of the data in the movie table where
		# the id is equal to the id sent in the request 
		# selected data will be returned in an array of actor objects 
		# store the array of actor objects in an instance variable
		# instance variable is availble to movies show.html.erb
		@movies = Movie.find(params[:id]).actors
	end

	# edit method gets called when the movies/:id/edit URL is requested
	# edit method is mapped to the movies edit.html.erb
	def edit
		# call find method on Movies model class giving it the id sent
		# in the request 
		# the find method selects all of the data in the movies table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable will be 
		# available to the edit.html.erb
		@movies = Movie.find(params[:id])
	end

	# update method gets called when the Update button is pushed on the
	# movies edit.html.erb
	def update
		# call find method on Movie model class giving it the id sent in the
		# request
		# find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in a variable
		movies = Movie.find(params[:id])
		# call update method on Actor object giving the first name and
		# last name parameters input in the actors edit.html.erb
		# update method updates the data in the movies table use the parameters
		if movies.update(movie_params)
			# if the update method succeeds, request the actors URL which
			# will render the movies index.html.erb in the browser
			redirect_to "/movies"
		else
			# if the update method fails, get the full messages associated
			# with the errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the requested URL
			flash[:errors] = movies.errors.full_messages
			# request the movies/:id/edit URL which will render the movies
			# edit.html.erb
			redirect_to "/movies/#{movies.id}/edit"
		end
	end

	# delete method gets called when the movies/:id/delete URL is requested
	# delete method is mapped to the movies delete.html.erb
	def delete
		# call find method on Movie model class giving it the id sent
		# in the request 
		# the find method selects all of the data in the movies table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable will be 
		# available to the delete.html.erb
		@movies = Movie.find(params[:id])
	end

	# destory method gets called when the Delete button is pushed on the 
	# movies delete.html.erb
	def destroy
		movies = Movie.find(params[:id])
		movies.destroy
		redirect_to "/movies"
	end

	private
	def movie_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:movie).permit(:title, :duration, :rating, :release_date)
	end
end
