# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create(username: "shanna", password: "shanna", password_confirmation: "shanna")
user2 = User.create(username: "pitbull", password: "pitbull", password_confirmation: "pitbull")
user3 = User.create(username: "seanpaul", password: "seanpaul", password_confirmation: "seanpaul")

message1 = Message.create
message1.users << user1
message1.users << user2

message2 = Message.create
message2.users << user1
message2.users << user2
message2.users << user3

Entry.create(text: "Hey dude", user_id: 1, message_id: 1)
Entry.create(text: "What's up", user_id: 2, message_id: 1)
Entry.create(text: "Let's go out tonight!", user_id: 3, message_id: 2)
Entry.create(text: "Okay sounds good", user_id: 2, message_id: 2)
Entry.create(text: "Where do you wanna go?", user_id: 1, message_id: 2)
