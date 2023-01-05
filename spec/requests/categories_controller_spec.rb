require 'rails_helper'

RSpec.describe Category, type: :request do
  before(:each) do
    @user = User.new(name: 'diego', email: 'diego@email.com', password: 'diego')
    @user.confirm
    sign_in @user
    @category = Category.new(name: 'Office Payments', icon: '123.png', user_id: @user.id)
    @category.save
    get categories_path
  end

  describe 'Testing the index method of Category controller' do
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end

    it 'should render index page' do
      expect(response).to render_template :index
    end

    it 'should have some html' do
      expect(response.body).to include 'CATEGORIES'
    end

    it 'should have category' do
      expect(response.body).to include 'Office Payments'
    end
  end
  describe 'Testing the new method of Category controller' do
    before(:each) { get new_category_path }
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end

    it 'should render index page' do
      expect(response).to render_template :new
    end

    it 'should have some html' do
      expect(response.body).to include 'CREATE CATEGORIES'
    end
  end
end
