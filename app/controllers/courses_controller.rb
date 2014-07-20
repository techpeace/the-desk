class CoursesController < InheritedResources::Base

  def create
    @course = current_user.courses.new(course_params)
    if @course.save
      flash[:success] = "Course created!"
      redirect_to course_path @course
    else
      flash[:error] = @course.errors.messages.values.join(", ")
      render :new
    end
  end

  def list_of_unassigned_standards
    respond_to do |format|
      format.json do
        course = Course.find params[:course_id]
        render :json => course.unassigned_standards
                          .select([:id, :text, :key, :keywords])
                          .sort { |one, two|
                            result = one.key.to_i <=> two.key.to_i
                            if result == 0
                              one_letter = one.key.match /[a-zA-z]/
                              two_letter = two.key.match /[a-zA-z]/

                              one_letter.to_s <=> two_letter.to_s
                            else
                              result
                            end
                          }
                          .to_json,
                          :status => :ok
      end
    end
  end

  def grade_standards
    respond_to do |format|
      format.json do
        render :json => StandardCourse.includes(:standards)
                          .where(standards: {grade: params[:grade]})
                          .select(:id, :name), :status => :ok
      end
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :standard_course_id, :grade)
  end
end
