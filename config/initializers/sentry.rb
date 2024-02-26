# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://sentry-parallel-68821@o0.ingest.sentry.io/0'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  config.dsn = ENV.fetch('SENTRY_DSN', nil)

  # config.environment = 'production'

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  # config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
end
