# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by(email: "test@test.com") do |u|
  u.username = "Seb"
  u.password = "test123"
end

box_category = BoxCategory.create(name: "main", user: user)

2.times do
  note = Note.create(name: Faker::FunnyName.name)
  note.rich_text.update(body: Faker::Quote.matz)
  Box.create(
    box_category: box_category,
    user: user,
    boxable: note
  )

  note = Note.create(name: Faker::FunnyName.name)
  note.rich_text.update(body: Faker::Quote.famous_last_words)

  Box.create(
    box_category: box_category,
    user: user,
    boxable: note
  )
end
