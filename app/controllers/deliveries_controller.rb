class DeliveriesController < ApplicationController
  def create
    date = Chronic.parse(params[:date])

    if date
      @lesson = Lesson.find(params[:lesson_id])
      @delivery = @lesson.deliveries.create(date: date)
    end

    render :json => {link: render_to_string("_delivery_link", layout: false)}
  end

  def destroy
    Delivery.find(params[:id]).destroy
  end
end
