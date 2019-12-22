# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying Participants'
Participant.destroy_all
puts 'Destroying Tlks'
Tlk.destroy_all
puts 'Destroying Users'
User.destroy_all

puts 'Making 2 users'
2.times do |i|
  User.create!(
    email: "#{i}@gmail.com",
    password: 'pwdpwd',
    bio: "Bio for user #{i}",
    username: "username#{i}"
  )
  puts "User #{i}: email: #{i}@gmail.com, password: pwdpwd"
end

puts 'Creating Tlk'
tlk = Tlk.create!(
  user: User.first,
  title: 'Taaalk Number 1',
  description: 'Description of Taaalk number 1'
)
puts 'Creating Tlk 1 Participant 1'
Participant.create!(
  tlk: tlk,
  user: User.first,
  name: "Participant name for user #{User.first.id}",
  bio: "Bio for participant #{User.first.id}"
)
puts 'Creating Tlk 1 Participant 2'
Participant.create!(
  tlk: tlk,
  user: User.last,
  name: "Participant name #{User.last.id}",
  bio: "Bio for participant #{User.last.id}"
)

puts 'Creating Tlk'
tlk2 = Tlk.create!(
  user: User.last,
  title: 'Taaalk Number 2',
  description: 'Description of Taaalk number 2'
)
puts 'Creating Tlk 2 Participant 1'
Participant.create!(
  tlk: tlk2,
  user: User.first,
  name: "Participant name for user #{User.first.id}",
  bio: "Bio for participant #{User.first.id}"
)
puts 'Creating Tlk 2 Participant 2'
Participant.create!(
  tlk: tlk2,
  user: User.last,
  name: "Participant name #{User.last.id}",
  bio: "Bio for participant #{User.last.id}"
)
