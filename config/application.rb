require_relative "boot"

require "rails"
require "action_controller/railtie"
require "action_dispatch/railtie"

Bundler.require(*Rails.groups)

module RorWithDocker
  class Application < Rails::Application
    config.load_defaults 8.1
    config.autoload_lib(ignore: %w[assets tasks])
    config.api_only = true
    config.hosts = []
  end
end
