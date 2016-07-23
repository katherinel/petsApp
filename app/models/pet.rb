class Pet < ActiveRecord::Base
	has_one :image, :dependent => :destroy
	belongs_to :gender
end
