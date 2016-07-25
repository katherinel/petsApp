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
end
