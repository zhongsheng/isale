require_dependency "isale/application_controller"

module Isale
  class HomeController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show, :index]
    # OPTIMIZE me
    def index
    end

    # TODO something
    def show
    end

  end
end
