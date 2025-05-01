class Category < ApplicationRecord
  has_many :transactions, dependent: :destroy
  
  validates :name, presence: true
  validates :category_type, presence: true, inclusion: { in: ['income', 'expense'] }
  
  scope :income_categories, -> { where(category_type: 'income') }
  scope :expense_categories, -> { where(category_type: 'expense') }
end 