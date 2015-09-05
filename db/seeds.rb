# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(username: "shanna", password: "shanna", password_confirmation: "shanna")
User.create(username: "pitbull", password: "pitbull", password_confirmation: "pitbull")
User.create(username: "seanpaul", password: "seanpaul", password_confirmation: "seanpaul")

Message.create
Message.create


Entry.create(text: "Hey dude", user_id: 1, message_id: 1)
Entry.create(text: "What's up", user_id: 2, message_id: 1)
Entry.create(text: "Let's go out tonight!", user_id: 3, message_id: 2)
Entry.create(text: "Okay sounds good", user_id: 2, message_id: 2)
Entry.create(text: "Where do you wanna go?", user_id: 1, message_id: 2)
