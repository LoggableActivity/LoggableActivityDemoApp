# frozen_string_literal: true

module ApplicationHelper
  def activity_action(activity)
    I18n.t("loggable.activity.#{activity.action}")
  end
end
