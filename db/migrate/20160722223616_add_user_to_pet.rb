class AddUserToPet < ActiveRecord::Migration
  def change
  	add_column :pets, :user, :integer
  end
end
