class DeliveriesController < ApplicationController
  def create
    date = Chronic.parse(params[:date])

    if date
      @delivery = Lesson.find(params[:lesson_id]).deliveries.create(date: date)
    end
    render :json => {date: @delivery.date.strftime("%a, %b %d, %Y")}
  end
end
