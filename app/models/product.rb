class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchaser

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :commodity
  belongs_to :burden_delivery
  belongs_to :event_region
  belongs_to :dispatch_nichiji

  validates :category_id, numericality: { other_than: 1 }
  validates :commodity_id, numericality: { other_than: 1 }
  validates :burden_delivery_id, numericality: { other_than: 1 }
  validates :event_region_id, numericality: { other_than: 1 }
  validates :dispatch_nichiji_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :product_name
    validates :product_explanation
    validates :category_id
    validates :commodity_id
    validates :burden_delivery_id
    validates :event_region_id
    validates :dispatch_nichiji_id
    validates :image
  end
  VALID_PRICEL_HALF = /\A[0-9]+\z/.freeze
  validates :price, presence: true, format: { with: VALID_PRICEL_HALF }, length: { minimum: 3, maxinum: 7 }, numericality: { only_integer: true,
                                                                                                                             greater_than: 300, less_than: 10_000_000 }
end