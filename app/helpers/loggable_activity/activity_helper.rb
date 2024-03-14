# frozen_string_literal: true

module LoggableActivity
  module ActivityHelper
    # include ApplicationHelper
    include LoggableActivity::Router

    def render_activity(activity)
      render partial: template_path(activity), locals: { activity: }
    end

    def t_action(action)
      I18n.t("loggable.activity.#{action}")
    end

    # def relation_type(relation_attrs)
    #   title = I18n.t("loggable.ctivity.models.#{relation_attrs[:record_type]}")
    #   if path = path_to_payload(relation_attrs[:path])
    #     path
    #   else
    #     title
    #   end
    # end
    require 'json'

    def format_json_for_display(hash_data)
      JSON.pretty_generate(hash_data)
    rescue JSON::ParserError
      hash_data.to_s 
    end

    private

    def action_template_path(activity)
      "loggable_activity/templates/#{activity.action.gsub('.', '/')}"
    end

    def template_path(activity)
      template_path = action_template_path(activity)
      if lookup_context.template_exists?(template_path, [], true)
        template_path
      else
        action = activity.action.split('.').last || 'default'
        "loggable_activity/templates/default/#{action}"
      end
    end
  end
end
