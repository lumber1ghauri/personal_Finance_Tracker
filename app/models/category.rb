class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: [:user_id, :category_type] }
  validates :category_type, presence: true, inclusion: { in: ["income", "expense"] }
  validates :user_id, presence: true

  scope :income_categories, -> { where(category_type: "income") }
  scope :expense_categories, -> { where(category_type: "expense") }
  scope :by_user, ->(user) { where(user_id: user.id) }
end
