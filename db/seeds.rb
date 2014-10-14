require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


filename = Rails.root.join("db/data/stadiums.csv")

CSV.foreach(filename, headers: true) do |row|
  row = row.to_hash
  stadium = Stadium.find_or_create_by(row)
  puts "#{stadium.name} in database."
end

