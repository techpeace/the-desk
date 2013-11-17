class LessonsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @lesson = current_user.lessons.create draft: true
    @delivery = @lesson.deliveries.build
    @deliveries = @lesson.deliveries.to_json
  end

  def show
    # TODO: Needs to be an interaction
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end

    @lesson = @user.lessons.find params[:id]
  end

  def update
    @lesson = LessonUpdate.run!(
      lesson: current_user.lessons.find(params[:id]),
      params: lesson_params
    )

    redirect_to @lesson, success: 'Lesson successfully created.'
  rescue ActiveInteraction::InvalidInteractionError
    # TODO: Figure out what to do with outcome.errors
    # flash[:error] =
    render :new
  end

  def calendar
    @lessons = current_user.lessons
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :body)
  end
end
