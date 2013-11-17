class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_type = @lesson.is_public ? 'public' : 'private'
    @comments = @lesson.comments

    # @new_comment = @lesson.comments.build caused errors
    # Seems like comments.build is adding a nul entry to
    # @lesson.comments collection and causes a no-method error
    # during view render
    #
    # Comment.new works
    @new_comment = Comment.new
  end

  def create
    # see note about using comments.build in index action
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if Comment.create(comment_params)
        format.html { redirect_to lesson_comments_path(@comment.lesson.id), notice: 'Comment was successfully posted.' }
      else
        raise
        format.html { render action: "index" }
      end
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
