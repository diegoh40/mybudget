require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'diego', email: 'diego@email.com', password: 'diego')
    @user.confirm
  end
  describe 'Testing the validations for user model' do
    it 'should be valid' do
      expect(@user).to be_valid
    end
    it 'should be valid' do
      expect(@user.name).to eq 'diego'
    end
    it 'should be valid' do
      expect(@user.email).to eq 'diego@email.com'
    end
    it 'should be valid' do
      expect(@user.password).to eq 'diego'
    end
  end
end
