class Transaction < ApplicationRecord
  belongs_to :category, optional: true

  belongs_to :account
  validates :amount, presence: true
  validates :date, presence: true
  validates :category_id, presence: true
end
