class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :user_name
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数混合で入力してください。' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :first_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角で入力してください。' }
    validates :last_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角で入力してください。' }
    validates :birthday
  end
end

# ニックネームが必須であること
# メールアドレスが必須であること
# メールアドレスが一意性であること
# メールアドレスは@を含む必要があること
# パスワードが必須であること
# パスワードは6文字以上であること
# パスワードは半角英数字混合であること
# パスワードは確認用を含めて2回入力すること
# 新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）
# ユーザー本名が、名字と名前がそれぞれ必須であること
# ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
# ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
# ユーザー本名のフリガナは全角（カタカナ）で入力させること
# 生年月日が必須であること
