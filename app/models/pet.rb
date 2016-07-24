class Pet < ActiveRecord::Base
	has_one :image, :dependent => :destroy
	belongs_to :gender
	belongs_to :user
	belongs_to :species
	validates_presence_of :name, :gender_id, :user_id, :species_id
	validate :birthday_must_be_past

	def user_verified?(current_user)
		current_user.id == self.user_id
	end

	def birthday_must_be_past
		if self.birthday.present? && self.birthday > Date.today
			errors.add(:birthday, "must be in the past")
		end
	end

	def age_in_years_months
		if self.birthday
			now = Time.now.utc.to_date
			days_gone_by = (now - self.birthday).to_i
			years = (days_gone_by / 365).floor # doesn't take into account leap years but also doesn't need to be super accurate for our purposes
			months = ((days_gone_by % 365) / 30).floor # a month is typically defined as about 30 days, some might be shorter or longer in there, but it's getting rounded anyway, and doesn't need to be extremely accuate for pet bdays...
			[years, months]
		end
	end
end
