module Isale
  class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    before_action :set_title
    before_action :authenticate_user!

    def authenticate_user!
      return true
    end

    private
    def set_title
      @title = t ".title"
    end

  end
end
