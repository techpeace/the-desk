class CalendarsController < ApplicationController
  def index
    hash = (params[:user_id] + params[:start])

    respond_to do |format|
      format.html
      format.json {
        deliveries = Rails.cache.fetch(hash, race_condition_ttl: 10) do
          time_range = Time.at(params[:start].to_i)..Time.at(params[:end].to_i)
          Delivery.get_dates_for_calendar_in time_range
        end
        render json: deliveries
      }
    end

  end
end