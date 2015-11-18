require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Peatio
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    config.i18n.enforce_available_locales = true

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'custom', 'zh-CN.yml')]
    # 只显示中文界面
    config.i18n.available_locales = ['zh-CN']
    config.i18n.default_locale = 'zh-CN'
    # config.i18n.available_locales = ['en', 'zh-CN', 'ko']

    config.autoload_paths += %W(#{config.root}/lib #{config.root}/lib/extras)

    #config.assets.precompile += ['bootstrap-datetimepicker.css']
    config.assets.initialize_on_precompile = true

    # Precompile all available locales
    Dir.glob("#{config.root}/app/assets/javascripts/locales/*.js.erb").each do |file|
      config.assets.precompile << "locales/#{file.match(/([a-z\-A-Z]+\.js)\.erb$/)[1]}"
    end

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.stylesheets     false
    end

    # Observer configuration
    config.active_record.observers = :transfer_observer
    # 让rails4以上的版本支持在production模式下访问静态资源
    # config.assets.enabled = true
    # config.serve_static_assets = true
    # config.action_dispatch.x_sendfile_header = nil
  end
end
