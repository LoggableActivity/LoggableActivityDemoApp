# frozen_string_literal: true


LoggableActivity.actor_model_name = 'User'
LoggableActivity.fetch_actor_name_from = 'email'
LoggableActivity.config_file_path = Rails.root.join('config/loggable_activity.yaml')
LoggableActivity.task_for_sanitization = false 