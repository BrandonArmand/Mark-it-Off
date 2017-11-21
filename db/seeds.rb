require 'faker'
Faker::UniqueGenerator.clear 

25.times do
    username = Faker::Internet.user_name
    User.create!(
            email: Faker::Internet.safe_email(username),
            username: username,
            password: '123456',
        )
end
users = User.all

200.times do
    Item.create!(
        user: users.sample,
        name: Faker::Lorem.sentence
        )
end
items = Item.all

User.create!(
    email: 'Admin@example.com',
    username: 'Mr.Fish',
    password: 'admin123'
    )

p "#{items.count} items created"
p "#{users.count} users created"