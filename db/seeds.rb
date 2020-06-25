# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "test@test.com", username: "Seb", password: "test123")

2.times do
  Box.create(
    user: user,
    name: Faker::FunnyName.name,
    boxable: Note.create(content: Faker::Quote.matz)
  )

  Box.create(
    user: user,
    name: Faker::FunnyName.name,
    boxable: Note.create(content: Faker::Quote.famous_last_words)
  )
end
