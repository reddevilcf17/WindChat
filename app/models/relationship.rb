class Relationship < ApplicationRecord
	# status: 0. request, 1 friends, 2. be requested
  belongs_to :user
end
