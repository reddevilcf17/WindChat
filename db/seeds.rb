# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MessageRecipient.destroy_all
Message.destroy_all
User.destroy_all

user1 = User.create(name: 'hung', email: 'hung1@abc.com', password:'123456')
user2 = User.create(name: 'Taylor', email: 'taylor@abc.com', password:'123456')
user3 = User.create(name: 'Nguyen Thanh Hung', email: 'hung3@abc.com', password:'123456')
messages = Message.create([
	{message_type: 'TEXT', recipient_id: user2.id, title: 'making date', content: 'Hey, I\'m Hung', user: user1, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'making date with me please', content: 'Nice to meet you', user: user1, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'making date with me now', content: 'I really like you', user: user1, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'making date, ok?', content: 'Do you wanna go out with me tonight?', user: user1, status: 1}
	])

messages1 = Message.create([
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out 1', content: 'Hey, I\'m Hung', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out abc', content: 'Nice to meet you', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out in a bar', content: 'I really like you', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out abc', content: 'You r the best singer ever.', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out ok', content: 'I\'m I right?', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out abc', content: 'oh you dont reply me', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'ok that\'s fine', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'ok i\'ll find you', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'im gonna meet you', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'Do you wanna go out with me tonight?', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'Do you like movie?', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'We gonna go to cinema, ok?', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'blah blah', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'what wrong with you', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'why u didnt answer my questions', user: user3, status: 1},
	{message_type: 'TEXT', recipient_id: user2.id, title: 'Hang out', content: 'whyyyyyyyyyyyyyy didnt youuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuUuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu!!!!!!!!!!!!!!!!!!', user: user3, status: 1}
	])

Relationship.create([
	{user_id: 20, friend_id: 21, relationship_status: 1, action: 1},
	{user_id: 20, friend_id: 22, relationship_status: 1, action: 1},
	{user_id: 21, friend_id: 20, relationship_status: 1, action: 1},
	{user_id: 21, friend_id: 22, relationship_status: 1, action: 1},
	{user_id: 22, friend_id: 20, relationship_status: 1, action: 1},
	{user_id: 22, friend_id: 21, relationship_status: 1, action: 1}
	])

# MessageRecipient.create([
# 	{message: messages[0], user: user2, sender_id: user1.id, status: '2'},
# 	{message: messages[1], user: user2, sender_id: user1.id, status: '1'},
# 	{message: messages[2], user: user2, sender_id: user1.id, status: '1'},
# 	{message: messages[3], user: user2, sender_id: user1.id, status: '1'}
# 	])

# MessageRecipient.create([
# 	{message: messages1[0], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[1], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[2], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[3], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[4], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[5], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[6], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[7], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[8], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[9], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[10], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[11], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[12], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[13], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[14], user: user2, sender_id: user3.id, status: '1'},
# 	{message: messages1[15], user: user2, sender_id: user3.id, status: '1'}
# 	])

