class AnalyticsController < ApplicationController
  def index
  end

  def summary
    json_data = JsonBuilder.new(current_user).build
    render json: json_data, status: 200
  end
end
