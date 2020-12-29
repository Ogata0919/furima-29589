class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :product
  has_many :purchase

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze 
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true do
    validates :user_name
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'は全角で入力してください。' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角で入力してください。' } do
    validates :first_katakana
    validates :last_katakana
  end
end
