require_dependency "isale/application_controller"

module Isale
  class V1::ProductsController < ActionController::API

    before_action :set_product, only: [:show, :edit, :update, :destroy]
    def index
      @products = Product.all
    end
    # GET /products/1.json
    def show
    end

    private
    def set_product
      @product = Product.find(params[:id])
    end


  end
end
