require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "GET './index' page" do
    before(:all) do
      @address = get '/users'
    end

    it 'it should return a valid status' do
      expect(@address).to eq(200)
    end
    it 'it should render the actual template correctly' do
      expect(get('/users')).to render_template('users/index')
    end
    it 'The response body should have the correct placeholder text' do
      expect(response.body).to include(' <h1>Here is a list of a post for a given user</h1>')
    end
  end

  describe "GET './show' page" do
    before(:all) do
      @address = get '/users/show'
    end

    it 'it should return a valid status' do
      expect(@address).to eq(200)
    end
    it 'it should render the actual template correctly' do
      expect(get('/users/show')).to render_template('users/show')
    end
    it 'The response body should have the correct placeholder text' do
      expect(response.body).to include(' <h1>Here is a list of a post for a given user</h1>')
    end
  end
end
