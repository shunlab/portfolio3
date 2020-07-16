# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

User.create!(name:  "山田 太郎",
             email: "sample@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

10.times do |n|
  Dish.create!(name: Faker::Food.dish,
               user_id: 1,
               description: "冬に食べたくなる、身体が温まる料理です",
               portion: 1.5,
               tips: "ピリッと辛めに味付けするのがオススメ",
               reference: "https://cookpad.com/recipe/2798655",
               required_time: 30,
               popularity: 5,
               cook_memo: "初めて作った割にはうまくできた！",
               user_id: 1)
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
