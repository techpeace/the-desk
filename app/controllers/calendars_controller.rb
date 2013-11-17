class CalendarsController < ApplicationController
  def index
    hash = Digest::SHA1.hexdigest(params[:user_id] + params[:start])

    respond_to do |format|
      format.html
      format.json {
        deliveries = Rails.cache.fetch(hash, expires_in: 10) do
          time_range = Time.at(params[:start].to_i)..Time.at(params[:end].to_i)
          Delivery.get_dates_for_calendar_in time_range
        end
        render json: deliveries
      }
    end

  end
end