require 'rails_helper'

RSpec.describe 'splash', type: :feature do
  before(:each) do
    @user = User.new(name: 'diego', email: 'diego@gmail.com', password: 'diego')
    @user.confirm
    @category = Category.create(name: 'Office Payments', icon: '123.png', user: @user)
    @transaction = Transaction.create(name: 'Over Time', amount: 200, category: @category,
                                      user: @user)
    visit new_user_session_path
    fill_in 'Email', with: 'diego@gmail.com'
    fill_in 'Password', with: 'diego'
    click_button 'Log in'
  end
  describe 'Testing index view of transaction' do
    before(:each) do
      click_link 'Office Payments'
    end
    it 'should contain page heading' do
      expect(page).to have_content 'TRANSACTIONS'
    end
    it 'should contain sign out button' do
      expect(page).to have_content 'Sign out'
    end
    it 'should have transaction name' do
      expect(page).to have_content 'Over Time'
    end
    it 'should have transaction amount' do
      expect(page).to have_content '$200'
    end
  end

  describe 'Testing new view of transaction' do
    before(:each) do
      click_link 'Office Payments'
      click_link 'Create Transaction'
    end
    it 'should have heading' do
      expect(page).to have_content 'CREATE TRANSACTION'
    end
    it 'should have name field' do
      expect(page).to have_field(type: 'text')
    end
    it 'should have submit field' do
      expect(page).to have_button(type: 'submit')
    end
  end
end
