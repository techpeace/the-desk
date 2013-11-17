class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @comments = @lesson.comments
  end

end
