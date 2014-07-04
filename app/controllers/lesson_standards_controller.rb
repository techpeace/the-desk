class LessonStandardsController < ApplicationController
  respond_to :json

  def destroy
    LessonStandard.where(standard_id: params[:id], lesson_id: params[:lesson_id]).first.try(:destroy!)
    render :json => {}, :status => :ok
  end
end
