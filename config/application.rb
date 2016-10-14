require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SpalahTest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.observers = :comment_observer
    config.active_job.queue_adapter = :sidekiq
    config.autoload_paths << "#{Rails.root}/app/services"
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    config.generators do |g|
      g.orm :active_record
    end
    # config.i18n.load_path += Dir.glob( File.dirname(__FILE__) + "lib/locales/*.{rb,yml}" )
  end
end
