# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Gender.create( name: 'Male' )
genders = Gender.create([{ id: 1, name: 'Male'}, { id: 2, name: 'Female'}, { id: 3, name: 'Unknown' }])
species = Species.create([{ name: 'Dog' }, { name: 'Cat' }, { name: 'Fish' }, { name: 'Bird' }, { name: 'Other' } ])