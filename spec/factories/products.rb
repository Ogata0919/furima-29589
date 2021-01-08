FactoryBot.define do
  factory :product do
    product_name             {"hoge"}
    product_explanation      {Faker::Lorem.sentence}
    category_id              {2}
    commodity_id             {2}
    burden_delivery_id       {2}
    dispatch_nichiji_id      {2}
    event_region_id          {2}
    price                    {"9999"}

    
    association :user

    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end


#ログインしているユーザーだけが、出品ページへ遷移できること
#画像は1枚必須であること(ActiveStorageを使用すること)
#商品名が必須であること
#商品の説明が必須であること
#カテゴリーの情報が必須であること
#商品の状態についての情報が必須であること
#配送料の負担についての情報が必須であること
#発送元の地域についての情報が必須であること
#発送までの日数についての情報が必須であること
#価格についての情報が必須であること
#価格の範囲が、¥300~¥9,999,999の間であること
#販売価格は半角数字のみ保存可能であること
