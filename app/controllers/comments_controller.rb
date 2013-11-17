class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_type = @lesson.is_public ? 'public' : 'private'
    @comments = @lesson.comments
  end

end
