class RenameAgeAsBirthday < ActiveRecord::Migration
  def change
  	remove_column :pets, :age_in_days
  	add_column :pets, :birthday, :date
  end
end
