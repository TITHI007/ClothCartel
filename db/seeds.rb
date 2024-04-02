# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# seeds.rb
Customer.destroy_all
Location.destroy_all
# # Create users

# User.create!(
#   f_name: "Yashi",
#   l_name: "Choksi",
#   email: "yashichoksi11@gmail.com",
#   password_digest: "Yashi@123",
#   category: "user"
# )

# User.create!(
#   f_name: "Tithi",
#   l_name: "Patel",
#   email: "tithigptd2000@gmail.com",
#   password_digest: "Tithi@123",
#   category: "Admin"
# )

Location.create!(
    area: "University",
  city: "Hamilton",
  province: "Ontario"
)

Location.create!(
    area: "University",
  city: "Missisauga",
  province: "Ontario"
)



# cloth=Cloth.all

# Feedback.create!(
#     [
#         {comment: 'Good One', created_by: User.first.f_name, cloth_id: cloth.sample.id},
#         {comment: 'Good One1', created_by: User.first.f_name, cloth_id: cloth.sample.id},
#         {comment: 'Good One2', created_by: User.second.f_name, cloth_id: cloth.sample.id}
#     ]
# )

Customer.create([
                      { f_name: 'Adam', l_name: 'Doe', email: 'adam@example.com', password_digest: BCrypt::Password.create('ad@123'), category: 'user' },
                      { f_name: 'Aiden', l_name: 'Smith', email: 'aiden@example.com', password_digest: BCrypt::Password.create('ai@123'),  category: 'admin' },
                    ])


user1= Customer.all
location1=Location.all

user1.each do |u|
  location1.each{|loc| loc.customers << u}
end