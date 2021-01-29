FactoryBot.define do
  factory :address_purchase do
    mail_number          { '594-0011' }
    event_region_id      { 2 }
    city                 { '大阪市北区' }
    addresses            { '大淀1-20-3' }
    building             { '若杉ビル 403' }
    phone_number         { '09078818935' }
    token { 'tok_abcdefghijk00000000000000000' }

  end
end

# ログインしていないユーザーは購入ページに遷移しようとすると、ログインページに遷移すること
# 出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移すること
# URLを直接入力して購入済み商品の購入ページへ遷移しようとすると、トップページに遷移すること
# クレジットカード決済ができること
# クレジットカードの情報は購入の都度入力させること
# クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと
# 配送先の住所情報も購入の都度入力させること
# 配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
# 郵便番号にはハイフンが必要であること（123-4567となる）
# 電話番号にはハイフンは不要で、11桁以内であること
# 購入が完了したら、トップページまたは購入完了ページに遷移すること
# 購入した商品は、再度購入できない状態になっていること
# エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）
