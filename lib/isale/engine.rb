require 'redis'
require 'redis/namespace'
module Isale
  class Engine < ::Rails::Engine
    isolate_namespace Isale

    initializer :setup_redis do
      $redis = Redis::Namespace.new("site_point", :redis => Redis.new)
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        pp config.paths["db/migrate"].expanded
        config.paths["db/migrate"].expanded.each { |x|
          app.config.paths["db/migrate"].push x
        }
      end
    end
  end
end
