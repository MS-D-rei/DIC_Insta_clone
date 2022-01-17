User.create!(
  name: 'Test Name',
  email: 'test@mail.com',
  password: 'foobar01',
  password_confirmation: 'foobar01'
)

50.times do |n|
  name = Faker::Name.name
  email = "test_#{n + 1}@mail.com"
  password = 'password'
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end

users = User.order(:created_at).take(5)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(content: content) }
end
