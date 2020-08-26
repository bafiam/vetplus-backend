# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# seed an admin
1.times do |index|

User.create!(
  email:"admin@gmail.com",
  username:"admin", 
  password: "123456789",
  password_confirmation: "123456789",
  user_type:"admin"
)
p "Admin Created"
end