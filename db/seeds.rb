# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding db..."

1..40.times do |provider|
  npi = ProviderCache.new
  npi.name = Faker::Games::Zelda.character
  npi.enumeration_type = [0, 1].sample
  npi.status = ["A", "I"].sample
  npi.credential = Faker::Number.number(digits: 10).to_s
  npi.registered_at = 15.days.ago
  npi.last_updated = [1.days.ago, 2.days.ago].sample

  npi.save!
  print "."
end
