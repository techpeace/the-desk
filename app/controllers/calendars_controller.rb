class CalendarsController < ApplicationController
  def index
    respond_to do |format|
      format.json {
        time_range = Time.at(params[:start].to_i)..Time.at(params[:end].to_i)
        @deliveries = Delivery.get_dates_for_calendar_in time_range
        render :json => @deliveries
      }
    end
  end
end
