# frozen_string_literal: true

module LoggableActivity
  module ActivityHelper
    require 'json'

    def render_activity(activity)
      render partial: template_path(activity), locals: { activity: }
    end

    def t_action(action)
      I18n.t("loggable.activity.#{action}")
    end

    def format_json_for_display(hash_data)
      JSON.pretty_generate(hash_data)
    rescue JSON::ParserError
      hash_data.to_s
    end
  end
end
