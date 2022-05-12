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
		# call constructor of Actor model class giving it the
		# first name and last name paramters input in the actors
		# new.html.erb
		# constructo creates Actor model object which is stored
		# in variable
		actor = Actor.new(actor_params)
		# call save method on Actor object
		# save method inserts the data in the Actor model object
		# into the actor table
		if actor.save
			# if the save method succeeds, request the actors URL
			# which will rendor the actors index.html.erb in the browser
			redirect_to "/actors"
		else
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the actors new.html.erb
			flash[:errors] = actor.errors.full_messages
			# if the save method fails, request the actors/new URL
			# which will rendor the actors new.html.erb in the browser
			redirect_to "/actors/new" 
		end
	end

	# show method gets called when the actors/:id URL is requested
	# show method is mapped to the actors show.html.erb
	def show
		# call find method on Actor model class giving it the id sent
		# in the request
		# find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request 
		# selected data will be returned in an array of movie objects 
		# store the array of movie objects in an instance variable
		# instance variable is availble to actors show.html.erb
		@movies = Actor.find(params[:id]).movies
	end

	# edit method gets called when the actors/:id/edit URL is requested
	# edit method is mapped to the actors edit.html.erb
	def edit
		# call find method on Actor model class giving it the id sent
		# in the request 
		# the find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable will be 
		# available to the edit.html.erb
		@actor = Actor.find(params[:id])
	end

	# update method gets called when the Update button is pushed on the
	# actors edit.html.erb
	def update
		# call find method on Actor model class giving it the id sent in the
		# request
		# find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in a variable
		actor = Actor.find(params[:id])
		# call update method on Actor object giving the first name and
		# last name parameters input in the actors edit.html.erb
		# update method updates the data in the actor table use the parameters
		if actor.update(actor_params)
			# if the update method succeeds, request the actors URL which
			# will render the actors index.html.erb int he browser
			redirect_to "/actors"
		else
			# if the update method fails, get the full messages associated
			# with the errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the requested URL
			flash[:errors] = actor.errors.full_messages
			# request the actors/:id/edit URL which will render the actors
			# edit.html.erb
			redirect_to "/actors/#{actor.id}/edit"
		end
	end

	# delete method gets called when the actors/:id/delete URL is requested
	# delete method is mapped to the actors delete.html.erb
	def delete
		# call find method on Actor model class giving it the id sent
		# in the request 
		# the find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable will be 
		# available to the delete.html.erb
		@actor = Actor.find(params[:id])
	end

	# destory method gets called when the Delete button is pushed on the 
	# actors delete.html.erb
	def destroy
		actor = Actor.find(params[:id])
		actor.destroy
		redirect_to "/actors"
	end

	private
	def actor_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:actor).permit(:first_name, :last_name, :image)
	end
end
