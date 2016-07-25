require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "should not save pet without a name" do
  #   pet = Pet.new
  #   assert_not pet.save
  # end

  test "should not save pet without a name, gender, user, and species" do
  	pet = Pet.new
  	assert_not pet.valid?
  	assert_equal [:name, :gender_id, :user_id, :species_id], pet.errors.keys
  end

  test "should not allow pet's birthday to be in the future" do
  	pet = pets(:future_bday_cat)
  	assert_not pet.valid?
  end

  test "age_in_years_months should return an array of two numbers, or nil if no birthday" do
  	pet_bday = Pet.new({:birthday => "2015-01-01"})
  	pet_no_bday = Pet.new
  	travel_to Time.new(2016, 7, 1, 12, 0, 0)
  	assert_equal pet_bday.age_in_years_months, [1, 6]
  	assert_equal pet_no_bday.age_in_years_months, nil
  end
end
