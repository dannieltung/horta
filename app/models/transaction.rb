class Transaction < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates_datetime :book, after: lambda { Time.current.in_time_zone("Brasilia") }, presence: true
end
