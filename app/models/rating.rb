class Rating < ApplicationRecord
	# has_many method specifies a one to many relationship
	# appearances option specifies that one movie has many appearances
	# destroy causes all appearances to be destroyed when their
	# related movie is destroyed
	has_many :appearances, dependent: :destroy
	# rating option specifies that one movie has many actors
	# the through option specifies that the relationship exists
	# only through appearances
	has_many :movies, through: :appearances
	# movie op specifies that one appearance has one movie
  	belongs_to :movie
	# validates method specifies that an actor is valid only if
	# a title, duration, rating and release date are present
	validates :title, :rating, :movie_id, presence: true
end
