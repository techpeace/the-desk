class LessonsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @lesson = current_user.lessons.create draft: true
  end

  def calendar
    @lessons = current_user.lessons
  end

  def show
    @user = User.where(id: params[:user_id])
    @lesson = @user.lessons.where(id: params[:id])
  end
end
