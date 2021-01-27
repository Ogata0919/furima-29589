require 'rails_helper'
describe AddressPurchase do
  before do
    @address = FactoryBot.build(:address_purchase)
  end

  describe '商品購入機能' do
    context '商品購入機能がうまくいくとき' do
      it '全項目が存在すれば登録できる' do
       expect(@address).to be_valid
      end
    end

    context '商品購入機能がうまくいかないとき' do

      it '郵便番号が空では購入できないこと' do
        @address.mail_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Mail number can't be blank")
      end

      it '郵便番号にはハイフンが必要であること' do
        @address.mail_number = '大淀中1203'
        @address.valid?
        expect(@address.errors.full_messages).to include("Mail number is invalid. Include hyphen(-)")
      end

      it '市区町村が空では購入できないこと' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できないこと' do
        @address.addresses = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が空では購入できないこと' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end


      it '電話番号はハイフンは不要あること' do
        @address.phone_number = '000-0000-0000'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number 電話番号を入力してください。")
      end

      it '電話番号は11桁以内であること' do
        @address.phone_number = '000000000000'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number 電話番号を入力してください。")
      end

      it '都道府県についての情報が"---"であれば購入できない' do
        @address.event_region_id = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include("Event region can't be blank")
      end

    end  
  end
end    

#配送先の住所情報も購入の都度入力させること
#配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
#郵便番号にはハイフンが必要であること（123-4567となる）
#電話番号にはハイフンは不要で、11桁以内であること
#購入が完了したら、トップページまたは購入完了ページに遷移すること