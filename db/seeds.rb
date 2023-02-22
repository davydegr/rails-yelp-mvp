# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Deleting all existing restaurants ...'
puts 'Automatically deleting all reviews because of dependent:destroy'

Restaurant.destroy_all
10.times do
  restaurant = Restaurant.new(
    name: Faker::Games::Pokemon.move,
    address: Faker::Games::Pokemon.location,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )


  restaurant.save
  puts "Generated #{restaurant.name} with ID = #{restaurant.id}"

  puts "Generating 3 reviews for #{restaurant.name}"
  3.times do
    review = Review.new(
      rating: rand(0..5),
      content: Faker::Quotes::Shakespeare.hamlet_quote
    )

    review.restaurant = restaurant

    review.save

    puts '--- Review saved'
  end
end
