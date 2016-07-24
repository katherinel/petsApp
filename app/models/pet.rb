class Pet < ActiveRecord::Base
	has_one :image, :dependent => :destroy
	belongs_to :gender
	belongs_to :user
	belongs_to :species
end
