require 'rails_helper'

RSpec.describe Transaction, type: :request do
  before(:each) do
    @user = User.new(name: 'diego', email: 'diego@email.com', password: 'diego')
    @user.confirm
    sign_in @user
    @category = Category.create(name: 'Office Payments', icon: '123.png', user_id: @user.id)
    @transaction = Transaction.create(name: 'Overtime Payment', amount: 200,
                                      category_id: @category_id, user_id: @user.id)
    get category_transactions_path(@category)
  end
  describe 'Testing the index method of Transaction controller' do
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end
    it 'should render index page' do
      expect(response).to render_template :index
    end
    it 'should have some html' do
      expect(response.body).to include 'TRANSACTIONS'
    end
  end

  describe 'Testing the new method of Transaction controller' do
    before(:each) { get new_category_transaction_path(@category) }
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end
    it 'should render new page' do
      expect(response).to render_template :new
    end
    it 'should have some html' do
      expect(response.body).to include '<h3 class="nav_heading">CREATE TRANSACTION</h3>'
    end
  end
end
