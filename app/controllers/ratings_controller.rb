class RatingsController < ApplicationController
  respond_to :json

  def update
    @lesson = Lesson.find(params[:lesson_id])
    @rating = @lesson.ratings.find_by(user: current_user)
    @rating.score = params[:score]
    @rating.save
    render :json => { errors: nil }, :status => :ok
  end
end
