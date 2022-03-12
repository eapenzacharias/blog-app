# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_1 = User.create(name: 'Cody Harper', photo: 'https://randomuser.me/api/portraits/men/15.jpg', bio: 'Viverra orci sagittis eu volutpat. Eget felis eget nunc lobortis mattis aliquam faucibus purus. Et leo duis ut diam quam nulla porttitor. Sem viverra aliquet eget sit amet tellus cras.')
user_2 = User.create(name: 'Dwayne Bradley', photo: 'https://randomuser.me/api/portraits/men/92.jpg', bio: 'Dolor purus non enim praesent elementum facilisis. Sagittis orci a scelerisque purus semper eget.')
user_3 = User.create(name: 'Dora Roberts', photo: 'https://randomuser.me/api/portraits/women/44.jpg', bio: 'In nibh mauris cursus mattis molestie a iaculis at. Egestas quis ipsum suspendisse ultrices gravida. Cursus metus aliquam eleifend mi in nulla posuere sollicitudin.')
user_4 = User.create(name: 'Nora Lawrence', photo: 'https://randomuser.me/api/portraits/women/15.jpg', bio: 'Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna. Turpis massa tincidunt dui ut ornare lectus.')
user_5 = User.create(name: 'Herminia Newman', photo: 'https://randomuser.me/api/portraits/women/56.jpg', bio: 'Sem viverra aliquet eget sit amet tellus cras. Sit amet consectetur adipiscing elit duis tristique sollicitudin nibh.')
user_6 = User.create(name: 'Clifton Soto', photo: 'https://randomuser.me/api/portraits/men/22.jpg', bio: 'Nullam vehicula ipsum a arcu cursus vitae congue mauris. Platea dictumst quisque sagittis purus sit. Commodo quis imperdiet massa tincidunt.')

post_1 = Post.create(author: user_1, title: 'Post 1', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
post_2 = Post.create(author: user_1, title: 'Post 2', text: 'Dui vivamus arcu felis bibendum ut tristique et egestas quis.')
post_3 = Post.create(author: user_1, title: 'Post 3', text: 'Malesuada proin libero nunc consequat. Laoreet non curabitur gravida arcu.')
post_4 = Post.create(author: user_3, title: 'Post 4', text: 'Sed elementum tempus egestas sed sed risus pretium quam vulputate. Viverra nam libero justo laoreet sit amet cursus sit amet.')
post_5 = Post.create(author: user_3, title: 'Post 5', text: 'Arcu odio ut sem nulla pharetra diam. Congue eu consequat ac felis donec et odio.')
post_6 = Post.create(author: user_3, title: 'Post 6', text: 'In ornare quam viverra orci sagittis eu volutpat odio.')
post_7 = Post.create(author: user_3, title: 'Post 7', text: 'Urna cursus eget nunc scelerisque viverra mauris. Tortor pretium viverra suspendisse potenti nullam ac.')
post_8 = Post.create(author: user_3, title: 'Post 8', text: 'Ut sem nulla pharetra diam sit amet nisl suscipit. Ornare arcu dui vivamus arcu.')

Comment.create(post: post_1, author: user_1, text: 'Cool comment 1!' )
Comment.create(post: post_2, author: user_2, text: 'Cool comment 2!' )
Comment.create(post: post_3, author: user_3, text: 'Cool comment 3!' )
Comment.create(post: post_4, author: user_4, text: 'Cool comment 4!' )
Comment.create(post: post_5, author: user_1, text: 'Cool comment 5!' )
Comment.create(post: post_6, author: user_1, text: 'Cool comment 6!' )
Comment.create(post: post_7, author: user_3, text: 'Cool comment 7!' )
Comment.create(post: post_8, author: user_4, text: 'Cool comment 8!' )
