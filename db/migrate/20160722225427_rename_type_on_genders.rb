class RenameTypeOnGenders < ActiveRecord::Migration
  def change
  	rename_column :genders, :type, :name
  end
end
