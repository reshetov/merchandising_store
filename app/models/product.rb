class Product < ApplicationRecord
  scope :filtered_by, ->(q) { where('code LIKE :query OR name LIKE :query', query: "%#{q}%") }

  enum :discount, %w[default more_three two_percent]

  validates :code, :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
