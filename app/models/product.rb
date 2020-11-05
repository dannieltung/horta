class Product < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  geocoded_by :address
  # geocoder vai ser em cima do campos address. quando colocar endereço no campo address, vou pegar a latitude e longitude dele.
  after_validation :geocode, if: :will_save_change_to_address?
  # rodar o geocoder de novo se os dados do endereço foram alterados.
  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
    against: [[:name, 'A'], [:address, 'B']],
  using: {
    tsearch: { prefix: true }
  }
end
