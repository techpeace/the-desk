class LessonStandardsController < ApplicationController
  respond_to :json

  def create
    current_standards = Lesson.find(params[:lesson_id]).standards.pluck(:id)

    params[:standardIds].each do |id|
      unless current_standards.include? id
        LessonStandard.new(standard_id: id, lesson_id: params[:lesson_id]).save!
      end
    end

    current_standards.each do |id|
      unless params[:standardIds].include? id
        LessonStandard.where(standard_id: id, lesson_id: params[:lesson_id]).first.destroy!
      end
    end


    render :json => {}, :status => :ok
  end

  def destroy
    LessonStandard.where(standard_id: params[:id], lesson_id: params[:lesson_id]).first.try(:destroy!)
    render :json => {}, :status => :ok
  end
end
