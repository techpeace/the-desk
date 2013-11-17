class DeliveriesController < ApplicationController
  def create
    date = Chronic.parse(params[:delivery][:date])

    if date
      @lesson = Lesson.find(params[:lesson_id])
      @delivery = @lesson.deliveries.create(date: date)
      render :json => @delivery
    end
  end

  def destroy
    Delivery.find(params[:id]).destroy

    render nothing: true, status: 200
  end
end
