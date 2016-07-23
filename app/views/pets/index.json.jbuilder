json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :age_in_days, :gender_id, :image_id
  json.url pet_url(pet, format: :json)
end
