require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "isale"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.default_locale = :"zh-CN"
    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'
  end
end
