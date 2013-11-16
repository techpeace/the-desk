class DeliveriesController < ApplicationController
  def create
    date = Chronic.parse(params[:date])

    if date
      @lesson = Lesson.find(params[:lesson_id])
      @delivery = @lesson.deliveries.create(date: date)
    end

    render :json => {date: @delivery.date.strftime("%a, %b %d, %Y ")}
  end

  def destroy
    Delivery.find(params[:id]).destroy
  end
end
