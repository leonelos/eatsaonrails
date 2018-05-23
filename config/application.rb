require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Enterprise
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.DATABASE_URL = "postgres://evmkmqhtjcuxpb:6092f0b6648608b1ca44a98b34e2d0dd87e7f8ddb6a09bd868abbf6168cdf4c4@ec2-50-19-224-165.compute-1.amazonaws.com:5432/d73io98339qhi9"

    config.autoload_paths << Rails.root.join('lib') #JSON web token 

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
