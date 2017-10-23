require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Loulou
  class Application < Rails::Application
    config.load_defaults 5.1
    config.api_only = true
    config.chanson_path = "#{Rails.root}/chansons"

    config.autoload_paths << Rails.root + 'app/operation'
    config.autoload_paths << Rails.root + 'lib'
    config.eager_load = true
  end
end
