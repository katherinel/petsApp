class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age_in_days
      t.integer :gender_id
      t.integer :image_id

      t.timestamps null: false
    end
  end
end
