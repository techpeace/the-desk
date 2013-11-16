class LessonsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @lesson = current_user.lessons.new
  end

  def calendar
    @lessons = current_user.lessons
  end
end
