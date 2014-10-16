# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#init tags
if Tag.count == 0
  puts 'init tags, please wait...'
  Tag.create([{name: 'Rails'},{name:'Life'},{name:'Angular JS'}])
  puts 'tags created succesfully. '
else
	puts 'you have tags initialized.'
end