class AddressPurchase
  include ActiveModel::Model
  attr_accessor :mail_number, :event_region_id, :city, :addresses, :building, :phone_number, :purchase_id, :product_id, :user_id, :token

  with_options presence: true do
    validates :mail_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :event_region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number
    validates :token
    validates :product_id
    validates :user_id
  end

  validates :phone_number, numericality: { message: 'is invalid. Include hyphen(-)' }
  validates :phone_number, length: { maximum: 11 }



  def save
    @purchase = Purchase.create(product_id: product_id, user_id: user_id)

    Address.create(mail_number: mail_number, event_region_id: event_region_id, city: city, addresses: addresses, building: building, phone_number: phone_number, purchase_id: @purchase.id)
  end
end
