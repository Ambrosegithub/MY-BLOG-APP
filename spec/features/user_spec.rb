require 'rails_helper'

RSpec.describe User, type: :feature do
    describe 'index page' do
        before(:each) do
            visit users_path
            @users = User.all
        end

        it 'should see the username of all other users' do
            @users.each do |user|
                expect(page).to have_content(user.name)
            end
        end

        it 'should see profile picture for each user' do
            @users.each do |user|
                expect(page).to have_css("img[src*='#{user.photo}']")
            end
        end

        it 'should see the number of posts each user has written' do
            @users.each do |user|
                expect(page).to have_content(user.posts_counter)
            end
        end

        it 'should redirect to user\'s show page when clicking on a user' do
            @users.each do |user|
                click_link(user.name)
                expect(page).to have_current_path(user_path(user))
            end
        end
    end

    describe 'show page' do
        before(:each) do
            @user = User.create(
                name: 'Titi Ambrose\'s mum',
                photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Poland.',
                posts_counter: 0
            )
            Post.create(
                author_id: @user.id,
                title: 'Hello micronauts',
                text: 'Microverse is the best! programing school',
                comments_counter: 0,
                likes_counter: 0
            )
            @user = User.all
            visit user_path(@user.first)
        end

        it 'should see the user\'s profile picture' do
            expect(page).to have_css("img[src*='#{@user.first.photo}']")
        end

        it 'should see the user\'s name' do
            expect(page).to have_content(@user.first.name)
        end

        it 'should see the number of posts the user has written' do
            expect(page).to have_content(@user.first.posts_counter)
        end

        it 'should see the user\'s bio' do
            expect(page).to have_content(@user.first.bio)
        end

        it 'should see the user\'s first 3 posts' do
            recent_posts = @user.first.recent_posts
            recent_posts.each do |post|
                expect(page).to have_content(post.title)
                expect(page).to have_content(post.text)
            end
        end

        it 'should see a button that view all user\'s posts' do
            expect(page).to have_link('See all posts')
        end

        it 'should redirect to posts show page when clicking on a user\'s post' do
            recent_posts = @user.first.recent_posts
            click_link(recent_posts.first.title)
            expect(page).to have_current_path(user_post_path(@user.first, recent_posts.first))
        end

        it 'should redirect to user\'s posts index page when clicking on \'See all posts\'' do
            click_link('See all posts')
            expect(page).to have_current_path(user_posts_path(@user.first))
        end
    end
end