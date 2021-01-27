class PurchaseController < ApplicationController
    def index
        @product = Product.find(params[:product_id])
        @address_purchase = AddressPurchase.new
    end    

    def create
        @product = Product.find(params[:product_id])
        @address_purchase = AddressPurchase.new(purchase_params)
        if  @address_purchase.valid?
            pay_item
            @address_purchase.save
            redirect_to root_path
        else
            render :index
        end    
    end

    private

    def purchase_params
      params.require(:address_purchase).permit(:mail_number, :event_region_id, :city, :addresses, :building, :phone_number, :purchase_id).merge(user_id: current_user.id, token: params[:token], product_id: @product.id)
    end
    
    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
        Payjp::Charge.create(
          amount:@product.price,  # 商品の値段
          card: purchase_params[:token],    # カードトークン
          currency: 'jpy'                 # 通貨の種類（日本円）
        )
    end
end
