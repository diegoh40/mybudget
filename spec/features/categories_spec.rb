require 'rails_helper'

RSpec.describe 'splash', type: :feature do
  before(:each) do
    @user = User.new(name: 'diego', email: 'diego@gmail.com', password: 'diego')
    @user.confirm
    @category = Category.create(name: 'Office Payments', icon: '123.png', user: @user)
    visit new_user_session_path
    fill_in 'Email', with: 'diego@gmail.com'
    fill_in 'Password', with: 'diego'
    click_button 'Log in'
  end
  describe 'Testing index view of categories' do
    it 'should contain page heading' do
      expect(page).to have_content 'CATEGORIES'
    end
    it 'should contain sign out button' do
      expect(page).to have_content 'Sign out'
    end
    it 'should have category name' do
      expect(page).to have_content 'Office Payments'
    end
    it 'should have category name' do
      expect(page).to have_content '$0'
    end
  end

  describe 'Testing new view of categories' do
    before(:each) { click_link 'Create Category' }
    it 'should have name field' do
      expect(page).to have_field(type: 'text')
    end
    it 'should have file field' do
      expect(page).to have_field(type: 'file')
    end
    it 'should have submit field' do
      expect(page).to have_button(type: 'submit')
    end
  end
end
