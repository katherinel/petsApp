class Pet < ActiveRecord::Base
	has_one :image, :dependent => :destroy
	belongs_to :gender
	belongs_to :user
	belongs_to :species

	def user_verified?(current_user)
		current_user.id == self.user_id
	end
end
