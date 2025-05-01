class Income < ApplicationRecord
  validates :title, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true

  scope :ordered, -> { order(date: :desc) }
end
