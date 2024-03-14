# frozen_string_literal: true

module ApplicationHelper
  def format_payload(payload)
    content_tag(:div, class: "payload") do
      concat content_tag(:p, "Actor Type: #{payload[:actor_type]}")
      concat content_tag(:p, "Actor ID: #{payload[:actor_id]}")
      concat content_tag(:p, "Action: #{payload[:action]}")
      concat content_tag(:p, "Actor Display Name: #{payload[:actor_display_name]}")
      
      concat content_tag(:h3, "Payloads:")
      payload[:payloads].each do |p|
        concat content_tag(:p, "Related to Activity As: #{p[:related_to_activity_as]}")
        concat content_tag(:p, "Attributes: #{p[:attrs].map { |k, v| "#{k}: #{v}" }.join(", ")}")

        # concat content_tag(:div, class: "payload-detail") do
        #   concat content_tag(:p, "Related to Activity As: #{p[:related_to_activity_as]}")
        #   concat content_tag(:p, "Record Type: #{p[:record_type]}")
        #   concat content_tag(:p, "Record ID: #{p[:record_id]}")
        #   concat content_tag(:p, "Attributes: #{p[:attrs].map { |k, v| "#{k}: #{v}" }.join(", ")}")
        #   concat content_tag(:p, "Route: #{p[:route]}")
        #   concat content_tag(:p, "Record Display Name: #{p[:record_display_name]}")
        #   concat content_tag(:p, "Current Payload: #{p[:current_payload]}")
        # end
      end
    end
  end
end
