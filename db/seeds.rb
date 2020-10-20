5.times do
  Blog.create({
    title: Faker::Book.title,
    body: Faker::Lorem.sentence
  })
end