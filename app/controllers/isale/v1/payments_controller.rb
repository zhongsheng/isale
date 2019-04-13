# coding: utf-8
module Isale
  class V1::PaymentsController< ActionController::API
    # before_action :set_payment
    # before_action :set_return_url, only: [:wechat_pay, :ali_pay]

    # GET /payments
    # GET /payments.json
    APP_HOST = ENV.fetch('TEST_HOST', 'test.dzunion.cn')
    CALLBACK_URI = "http://#{APP_HOST}/isale/v1/pay_callback"
    WECHAT_PAY_URI = "http://#{APP_HOST}/wechatpay"
    SUCCESS_URI = "http://#{APP_HOST}/air_purifier/show"

    def buy
      @product = Product.find(params[:id])

      render plain: ali_pay(@product)
    end

    private
    def ali_pay(product)
      success_uri = 'http://test.dzunion.cn'
      return_url = 'http://test.dzunion.cn/isale/v1/pay_callback'
      alipay_path = Rails.root.join('config','alipay')
      @alipay_client = Alipay::Client.new(
        url: 'https://openapi.alipay.com/gateway.do',
        app_id: '2018111262127673',
        app_private_key: File.read( "#{alipay_path}/rsa_private_key.pem" ),
        alipay_public_key: File.read("#{alipay_path}/rsa_public_key.pem"),
      )
      return @alipay_client.page_execute_form(
        method: 'alipay.trade.wap.pay',
        return_url: success_uri,
        notify_url: return_url,
        biz_content: {
          out_trade_no: Time.now.to_i.to_s,
          product_code: 'FAST_INSTANT_TRADE_PAY',
          total_amount: '0.1',
          subject: 'test',
          quit_url: 'http://test.dzunion.cn/',
        }.to_json(ascii_only: true), # to_json(ascii_only: true) is important!
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:total_fee, :pay_method, :customer, :ip, :equipment)
    end

    def pay_digest(time_stamp)
      salt = 'Kangrui@123'
      Digest::MD5.hexdigest( time_stamp + salt )
    end

    def set_return_url
      price_id = params[:set_price_id] || session[:set_price_id]
      @set_price = SetPrice.find(price_id)
      time_stamp = Time.now.to_i.to_s
      @success_uri = SUCCESS_URI + '?a=' + time_stamp
      @return_url = "#{CALLBACK_URI}/#{session[:eq_code]}/#{@set_price.time}/#{time_stamp}/#{pay_digest(time_stamp)}"
    end
  end
end
