class RenameUserToUserIdOnPets < ActiveRecord::Migration
  def change
  	rename_column :pets, :user, :user_id
  end
end
