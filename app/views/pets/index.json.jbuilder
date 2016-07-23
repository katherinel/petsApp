json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :birthday, :gender_id, :image_id
  json.url pet_url(pet, format: :json)
end
