class Product < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  geocoded_by :address
  # geocoder vai ser em cima do campos address. quando colocar endereço no campo address, vou pegar a latitude e longitude dele.
  after_validation :geocode, if: :will_save_change_to_address?
  # rodar o geocoder de novo se os dados do endereço foram alterados.
end
