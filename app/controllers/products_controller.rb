class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
    @product = Product.create(product_params)
    redirect_to "/products/#{@product.id}"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def addToSession
    session[:cart] = [] if session[:cart].nil?


  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
