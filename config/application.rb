require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OpenaiEmailResponder
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :rspec
      generate.fixture_replacement :factory_bot
      generate.factory_bot dir: 'spec/factories'
      generate.controller_specs false
      generate.request_specs true
      generate.helper_specs false
      generate.feature_specs true
      generate.mailer_specs true
      generate.model_specs true
      generate.observer_specs false
      generate.routing_specs false
      generate.view_specs false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
