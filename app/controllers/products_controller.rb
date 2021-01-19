class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :show, :update]

  def index
    @products = Product.all.order('created_at DESC')
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

  def show
  end

  def edit
    return redirect_to root_path if current_user.id !=  @product.user.id       
  end

  def update
    if @product.update(product_params)
        redirect_to product_path
    else
        render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explanation, :category_id, :commodity_id, :dispatch_nichiji_id, :burden_delivery_id, :event_region_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
