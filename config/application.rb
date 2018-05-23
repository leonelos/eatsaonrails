require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Enterprise
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.DATABASE_URL = "mysql://bc4785eaf284e9:16cf2fa7@us-cdbr-iron-east-04.cleardb.net/heroku_6b4aefadd3f8873?reconnect=true"

    config.autoload_paths << Rails.root.join('lib') #JSON web token 

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
