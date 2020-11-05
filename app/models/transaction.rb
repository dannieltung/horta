class Transaction < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :book, presence: true
end
