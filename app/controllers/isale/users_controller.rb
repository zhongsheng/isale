# coding: utf-8
require_dependency "isale/application_controller"

module Isale
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    # GET /users
    def index
      @users = User.all
    end

    # GET /users/1
    def show
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    def login
      render :login, layout: 'isale/login'
    end

    # TODO translate to I18n
    def session_create
      user = User.find_by({name: user_params[:name]})
      if user
        if user.authenticate?(user_params[:password])
          log_in(user)
          render js: "window.location.assign('#{root_url}')"
          return
        else
          render js: 'alert("密码错误")'
          return
        end
      else
        render js: 'alert("用户名不存在")'
        return
      end
    end

    def session_destroy
      log_out
      redirect_to root_url
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:name, :password, :role)
      end
  end
end
