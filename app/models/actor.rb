class Actor < ApplicationRecord
	# validates method specifies that an actor is valid only if
	# a first name and last name are present
	validates :first_name, :last_name, presence: true
end
