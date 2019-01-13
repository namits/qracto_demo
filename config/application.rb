require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DevdapApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.paths << Rails.root.join('vendor')
    config.secret_key_base = '0978a8db58ff16c1500f24afd4f15430ae52181d5d816186a849b7403ef7a15f673cbc21da475212d617ad907a75f6338aa26da0445b97cbffedb7699a2e6b9a'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
