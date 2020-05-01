100.times do |n|
  User.create(
    email: Faker::Internet.unique.email,
    username: Faker::Name.unique.name,
    password: 'password',
    password_confirmation: 'password'
  )
end