require 'rails_helper'
describe do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it '全項目が存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品機能がうまくいかないとき' do
      it '画像が空であれば出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空であれば出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が空であれば出品できない' do
        @product.product_explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product explanation can't be blank")
      end

      it 'カテゴリーの情報が空であれば出品できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態についての情報が空であれば出品できない' do
        @product.commodity_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Commodity must be other than 1')
      end

      it '配送料の負担についての情報が空であれば出品できない' do
        @product.burden_delivery_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Burden delivery must be other than 1')
      end

      it '発送元の地域についての情報が空であれば出品できない' do
        @product.event_region_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Event region must be other than 1')
      end

      it '発送までの日数についての情報が空であれば出品できない' do
        @product.dispatch_nichiji_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Dispatch nichiji must be other than 1')
      end

      it '価格についての情報が空であれば出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is too short (minimum is 3 characters)')
      end

      it '価格の範囲が、¥300~¥9,999,999の間でなければ出品できない' do
        @product.price = '0'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is too short (minimum is 3 characters)')
      end

      it '販売価格は半角数字でなければ出品できない' do
        @product.price = '１００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is too short (minimum is 3 characters)')
      end
    end
  end
end

# ログインしているユーザーだけが、出品ページへ遷移できること
# 画像は1枚必須であること(ActiveStorageを使用すること)
# 商品名が必須であること
# 商品の説明が必須であること
# カテゴリーの情報が必須であること
# 商品の状態についての情報が必須であること
# 配送料の負担についての情報が必須であること
# 発送元の地域についての情報が必須であること
# 発送までの日数についての情報が必須であること
# 価格についての情報が必須であること
# 価格の範囲が、¥300~¥9,999,999の間であること
# 販売価格は半角数字のみ保存可能であること
