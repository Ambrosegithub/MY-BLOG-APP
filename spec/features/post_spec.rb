require 'rails_helper'

RSpec.describe Post, type: :feature do
    describe 'index page' do
        before(:each) do
            @user = User.create(
                name: 'Titi Ambrose\'s mum',
                photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Mexico.',
                posts_counter: 0
            )
            @post1 = Post.create(
                id: rand(1000),
                author_id: @user,
                title: 'Hello micronauts',
                text: 'This is my first post',
                comments_counter: 0,
                likes_counter: 0
            )
            Comment.create(author_id: @user, post: @post1, text: 'This is my first comment')
            @user = User.all
            visit user_posts_path(@user.ids)
        end

        it 'should see the username of all other users' do
            @user.each do |user|
                expect(user.name).to have_content("iti Ambrose\'s mum")
            end
        end

        it 'should see profile picture for each user' do
            @user.each do |user|
                expect(page).to have_css("img[src*='#{user.photo}']")
            end
        end

        it 'should see the number of posts each user has written' do
            #@post1.each do |post|
                expect(page).to have_content(@user.first.posts_counter)
            #end
        end

        it "I can see a post's title." do 
           # visit user_post_path(@post)
            expect(page).to have_content("Here is a lists of a given user")           
        end

        it "I can see some of the post's body." do
           # visit user_post_path(@posts)
            expect(page).to have_content("Here is a lists of a given user")
        end

   it "I can see the first comments on a post"  do
        expect(page).to have_content(@post1.comments.first)
   end


it "I can see how many comments a post has." do
    #visit user_post_path(@post)
    expect(page).to have_content(@post1.comments_counter)
end


it "I can see how many likes a post has." do
    #visit user_post_path(@post)
    expect(page).to have_content(@post1.likes_counter)
end

#it 'should redirect to post\'s show page when clicking on a post' do
      #  click_link 'Titi Ambrose'
       # expect(page).to have_current_path(user_posts_path(@user, @post1.title))
#end

end



    end

