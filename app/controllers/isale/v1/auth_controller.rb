# coding: utf-8
require_dependency "isale/application_controller"
require 'securerandom'

module Isale
  class V1::AuthController < ActionController::API

    def url
      token = SecureRandom.hex(16)
      # TODO 恶意请求会导致大量存储, set expired time
      # 将redirect_uri 存储起来，用户登入后跳转到这个uri
      $redis.set(token, params.to_json)

      if request.headers['HTTP_USER_AGENT'].include?('MicroMessenger')
        login_url = Wechatruby.rails_client.code_request_url(v1_auth_info_url(token: token, from: 'wx'))
      else
        login_url = Alipay.login_url(scope: 'auth_base',
                                     redirect_uri: v1_auth_info_url(token: token, from: 'alipay') )
      end

      render json: {url: login_url, token: token}
    end

    def info
      pp params
      if params[:from] == 'wx'
        res = Wechatruby.rails_client.get_user_info(params[:code])
      else
        res = JSON.parse Alipay.rails_client.execute(
                           method: 'alipay.system.oauth.token',
                           code: params[:auth_code],
                           grant_type: 'authorization_code',
                         )
        # pp res
        # TODO
        # more infomation https://docs.open.alipay.com/284/106001/
        user_id = res['alipay_system_oauth_token_response']['user_id']
        pp user_id
        # TODO handle timeout
      end
      redirect_to JSON.load($redis.get(params[:token]))['redirect_uri']
    end

    private


    def store
    end

    # TODO
    def wechat_login_url
    end

  end
end
