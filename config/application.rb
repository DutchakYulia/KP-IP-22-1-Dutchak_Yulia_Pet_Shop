require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module PetshopStore
  class Application < Rails::Application
    config.load_defaults 7.1

    config.time_zone = "Kyiv"
    config.i18n.default_locale = :uk
    config.i18n.available_locales = %i[uk en]
    config.i18n.load_path += Dir[Rails.root.join("config", "locale", "**", "*.{rb,yml}")]
  end
end
