require_dependency "isale/application_controller"

module Isale
  class V1::ProductsController < ActionController::API

    def index
      @products = Product.all
    end

  end
end
