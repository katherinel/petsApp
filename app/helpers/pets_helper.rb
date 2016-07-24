module PetsHelper
	def age(pet)
		if pet.age_in_years_months.nil? || pet.age_in_years_months.empty?
			"Unknown"
		else
			"#{ pet.age_in_years_months[0] } years, #{ pet.age_in_years_months[1] } months"
		end
	end
end
