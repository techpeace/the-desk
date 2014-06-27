class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = Comment.new(comment_params)

    if @comment.save!
       redirect_to lesson_path(@comment.lesson.id), notice: 'Comment was successfully posted.'
    else
      redirect_to lesson_path(@comment.lesson.id), notice: 'Unable to post comment at this time.'
    end
  end

protected

  def comment_params
    params.require(:comment).permit(
      :user_id,
      :lesson_id,
      :message
    )
  end

end
