class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions

  has_one_attached :image

  validates :name, presence: true, length: { maximum: 250 }

  def total_transactions_amount
    total = 0
    transactions.each do |transaction|
      total += transaction.amount
    end
    total
  end
end
