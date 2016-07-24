module PetsHelper
	def age(pet)
		"#{ pet.age_in_years_months[0] } years, #{ pet.age_in_years_months[1] } months"
	end
end
