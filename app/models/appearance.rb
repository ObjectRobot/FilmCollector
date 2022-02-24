class Appearance < ApplicationRecord
  # belongs_to method specifies a one to one relationship
  # actor options specifies that one appearance has one actor
  belongs_to :actor
  # movie op specifies that one appearance has one movie
  belongs_to :movie
  # validates method specifies that an appearance is valid only if
  # an actor id and movie id are present
  validates :actor_id, :movie_id, presence: true
end
