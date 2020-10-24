class Product < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
end
