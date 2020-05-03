puts 'Start inserting seed "users" ...'
100.times do |n|
  user = User.create(
    email: Faker::Internet.unique.email,
    username: Faker::Name.unique.name,
    password: 'password',
    password_confirmation: 'password'
  )
  puts "\"#{user.username}\" has created!"
end