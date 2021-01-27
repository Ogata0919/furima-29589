class PurchaseController < ApplicationController
    def index
        @product = Product.find(params[:product_id])
        @address_purchase = AddressPurchase.new
    end    

    def create
        @product = Product.find(params[:product_id])
        
        @address_purchase = AddressPurchase.new(purchase_params)
        if  @address_purchase.valid?
            @address_purchase.save
           redirect_to root_path
        else
            render :index
        end    
    end

    private

    def purchase_params
      params.require(:address_purchase).permit(:mail_number, :event_region_id, :city, :addresses, :building, :phone_number, :purchase_id).merge(user_id: current_user.id,product_id: @product.id)
    end
end
