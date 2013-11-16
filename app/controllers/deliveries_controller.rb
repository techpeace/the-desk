class DeliveriesController < ApplicationController
  def create
    date = Chronic.parse(params[:delivery][:date])

    if date
      delivery = Lesson.find(params[:lesson_id]).deliveries.create(delivery_params)
      render :json => delivery.date
    else
      render :json => {}
    end
  end

  private

  def delivery_params
    params.required(:delivery).permit(:date)
  end
end
