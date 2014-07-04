class LessonsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @lesson = current_user.lessons.create draft: true
    setup_variables_for_new_edit
  end

  def edit
    @lesson = Lesson.find(params[:id])
    setup_variables_for_new_edit
    render :new
  end

  def show
    # TODO: Needs to be an interaction
    @lesson = Lesson.find(params[:id])
    @new_comment = Comment.new
    @rating = @lesson.ratings.where(user_id: current_user.id).first_or_create
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
    params.require(:lesson).permit(:title, :body, :course_id)
  end

  def setup_variables_for_new_edit
    @deliveries = @lesson.deliveries.to_json
    @delivery = @lesson.deliveries.build
    @standard = @lesson.lesson_standards.build
  end
end
