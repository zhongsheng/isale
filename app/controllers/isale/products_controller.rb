# coding: utf-8
require_dependency "isale/application_controller"

module Isale
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :set_title

    # GET /products
    # GET /products.json
    def index
      if params[:hidden]
        @products = Product.hiddened.paginate(page: params[:page], per_page: 30)
        @subtitle = "下架的产品"
      else
        @products = Product.paginate(page: params[:page], per_page: 30)
      end

    end

    def restore
      Product.restore(params[:product_id])
      redirect_to products_url
    end

    # GET /products/1
    # GET /products/1.json
    def show
    end

    # GET /products/new
    def new
      @product = Product.new
    end

    # GET /products/1/edit
    def edit
    end

    # POST /products
    # POST /products.json
    def create
      @product = Product.new(product_params)
      respond_to do |format|
        if @product.save
          add_tags(@product.id)
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      respond_to do |format|
        if @product.update(product_params)
          add_tags(@product.id)
          format.html { redirect_to @product, notice: I18n.t('successfully.updated') }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: I18n.t('successfully.destroyed') }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      @subtitle = @product.name
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :content, :category_id,
                                      :contry_id, :wholesale_price, :market_price,
                                      :supplier_id
                                     )
    end

    def add_tags(product_id)
      unless params[:product_tags].blank?
        ProductTag.where(product_id: product_id).delete_all
        ProductTag.create( params[:product_tags].map { |tag|
                             {product_id: product_id, tag_id: tag}
                           })
      end
    end

  end
end
