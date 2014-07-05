class LessonStandardsController < ApplicationController
  respond_to :json

  def create
    params[:standardIds].each do |id|
      LessonStandard.new(standard_id: id, lesson_id: params[:lesson_id]).save!
    end

    render :json => {}, :status => :ok
  end

  def destroy
    LessonStandard.where(standard_id: params[:id], lesson_id: params[:lesson_id]).first.try(:destroy!)
    render :json => {}, :status => :ok
  end
end
