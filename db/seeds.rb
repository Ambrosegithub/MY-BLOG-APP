# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
 #migration
#rails g migration CreateUsers name:string photo:text bio:text posts_counter:integer
#rails g migration CreatePosts title:string text:string comments_counter:integer likes_counter:integer
#rails g migration CreateComments text:string 
#rails g migration CreateLikes
#rails g migration AddUserRefToPosts user:references:index
#rails g migration AddUserRefToComments user:references:index
#rails g migration AddUserRefToLikes user:references:index
#rails g migration AddPostRefToComments post:references:index
#rails g migration AddPostRefToLikes post:references:index
#rails db:migrate

first_user = User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(id: 2, name: 'Titi Ambrose\'s mum', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author_id: 1, title: 'Hello Best mum', text: 'This is my first post')
second_post = Post.create(author_id: 1, title: 'Hello progrmmers', text: 'Ruby on Rails is awesome!')
third_post = Post.create(author_id: 2, title: 'Hello Rubyrians', text: 'Ruby on Rails is very fast!')
fourth_post = Post.create(author_id: 2, title: 'Hello micronauts', text: 'Microverse is the best! programing school')

first_comment = Comment.create(author_id: 1, post: first_post, text: 'This is my first comment')
second_comment = Comment.create(author_id: 1, post: first_post, text: 'I Love programming')
third_comment = Comment.create(author_id: 1, post: first_post, text: 'its fun to learn')
fourth_comment = Comment.create(author_id: 1, post: first_post, text: 'I have the best mum in the world')
fifth_comment = Comment.create(author_id: 1, post: first_post, text: 'I love my mum')
sixth_comment = Comment.create(author_id: 1, post: first_post, text: 'I love my dad')

# reviewer request
 #updating 
 # The migration
#add_reference :posts, :author, index: true
#add_foreign_key :posts, :users, column: :author_id

# The model
#belongs_to :author, class_name: "User"

AJANLEKOKO ARIBIDESI 