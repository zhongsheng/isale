module Isale
  class ApplicationController < ActionController::Base
    include Isale::UsersHelper

    layout 'isale/dashboard'
    protect_from_forgery with: :exception
    before_action :set_title
    before_action :authenticate_user!

    private
    def set_title
      @title = t ".title"
    end

  end
end
