class ProductsController < ApplicationController
    before_action :authenticate_user!, except: :index

    def index

    end    
    
    def new
        @product = Product.new
    end    

    def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to root_path
        else
          render :new
        end
    end
    
    private

    def product_params
      params.require(:product).permit(:category_id, :commodity_id, :dispatch_nichiji_id, :burden_delivery_id, :event_region_id)
    end
  
end
