class Category < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :account
  has_many :transactions
end
