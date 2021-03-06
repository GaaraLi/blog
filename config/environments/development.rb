Blog::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  config.cache_store = :dalli_store, '127.0.0.1:11211', { :namespace=>'rails:blog', :expires_in=> 1.day, :compress=> true}

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Ember.js
  config.ember.variant = :development

  # Email
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: "http://localhost:3000" }
  config.action_mailer.smtp_settings = {
    :address => "smtp.exmail.qq.com",
    :port => 587,
    :domain => "exmail.qq.com",
    :authentication => "plain",
    :user_name => "361497565@qq.com",
    :password => "realwol361497565"
    # :enable_starttls_auto => true
  }

  # ExceptionNotification configuration
  Blog::Application.config.middleware.use ExceptionNotification::Rack,
  :email => {
    :email_prefix => "[Blog Error] ",
    :sender_address => %{"361497565" <361497565@qq.com>},
    :exception_recipients => %w{realwol@126.com}
  }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
end
