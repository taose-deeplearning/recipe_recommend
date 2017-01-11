require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module RecipeRecommend
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Setting for rspec
    RakutenWebService.configure do |c|
      c.application_id = ENV["RAKUTEN_APPID"]
      c.affiliate_id = ENV["RAKUTEN_AFID"]
    end

    config.generators do |g|

      g.assets false
      g.helper false
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    I18n.enforce_available_locales = true
    config.i18n.default_locale = :ja
  end
end
