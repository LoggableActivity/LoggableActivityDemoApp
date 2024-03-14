# frozen_string_literal: true

require 'action_view'

module LoggableActivity
  module Router
    # include ApplicationHelper
    include LoggableActivity::RoutesHelper

    def primary_activity_text_or_link(activity)
      # route = activity.primary_route
      # # text = text_for_link(route)
      # text = route
      # return text if route.nil?
      # return text if activity.record.nil?

      # url = url_to_record(route, activity.record)
      # return text unless url.present?

      # link_to(text, url)
      "Please implement"
    end

    def payload_type_text_or_link(attrs)
      # route = attrs[:route]
      # model_translation = model_translation(attrs)
      # return model_translation if route.nil?

      # record = find_record(attrs)
      # return model_translation if record.nil?

      # url = url_to_record(route, record)
      # return model_translation if url.nil?

      # # text_for_link = text_for_link(route)
      # link_to(model_translation, url)
      "Please implement"
    end

    def update_attrs(attrs)
      # attrs.filter { |p| p[:payload_type] == 'update_payload' }
      attrs
    end

    def update_relation_attrs(attrs)
      # filtered_attrs = attrs.filter do |p|
      #   p[:payload_type] == 'previous_relation' || p[:payload_type] == 'current_relation'
      # end.sort_by { |p| p[:uuid] }
      attrs

    end

    private

    def text_for_link(route)
      I18n.t("loggable.activity.routes.#{route}")
    end

    def model_translation(attrs)
      I18n.t("loggable.activity.models.#{attrs[:record_type]}")
    end

    def find_record(attrs)
      record_class = attrs[:record_type].constantize
      record_class.find(attrs[:record_id])
    end
  end
end
