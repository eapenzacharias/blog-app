# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_1 = User.create(name: 'User 1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user_2 = User.create(name: 'User 2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
user_3 = User.create(name: 'User 3', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user_4 = User.create(name: 'User 4', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
user_5 = User.create(name: 'User 5', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user_6 = User.create(name: 'User 6', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

post_1 = Post.create(author: user_1, title: 'Post 1', text: 'This is my first post')
post_2 = Post.create(author: user_1, title: 'Post 2', text: 'This is my first post')
post_3 = Post.create(author: user_1, title: 'Post 3', text: 'This is my first post')
post_4 = Post.create(author: user_3, title: 'Post 4', text: 'This is my first post')
post_5 = Post.create(author: user_3, title: 'Post 5', text: 'This is my first post')
post_6 = Post.create(author: user_3, title: 'Post 6', text: 'This is my first post')
post_7 = Post.create(author: user_3, title: 'Post 7', text: 'This is my first post')
post_8 = Post.create(author: user_3, title: 'Post 8', text: 'This is my first post')

Comment.create(post: post_1, author: user_1, text: 'Cool comment 1!' )
Comment.create(post: post_1, author: user_2, text: 'Cool comment 2!' )
Comment.create(post: post_1, author: user_3, text: 'Cool comment 3!' )
Comment.create(post: post_1, author: user_4, text: 'Cool comment 4!' )
Comment.create(post: post_5, author: user_1, text: 'Cool comment 5!' )
Comment.create(post: post_5, author: user_1, text: 'Cool comment 6!' )
Comment.create(post: post_5, author: user_3, text: 'Cool comment 7!' )
Comment.create(post: post_5, author: user_4, text: 'Cool comment 8!' )