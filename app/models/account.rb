# app/models/account.rb
class Account < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories
  has_many :transactions
end

class Transaction < ApplicationRecord
end
