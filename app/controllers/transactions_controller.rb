class TransactionsController < ApplicationController
  def index
    @category = current_user.categories.find(params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new(name: trans_params[:name],
                                              amount: trans_params[:amount], user_id: current_user.id)
    if @transaction.save
      flash[:notice] = 'Transaction is completed'
      redirect_to category_transactions_path(@category)
    else
      flash[:notice] = 'Invalid Transaction!'
    end
  end

  private

  def trans_params
    params.require(:transaction).permit(:name, :amount)
  end
end
