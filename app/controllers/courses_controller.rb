class CoursesController < InheritedResources::Base

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course created!"
      redirect_to course_path @course
    else
      flash[:error] = @course.errors.messages.values.join(", ")
      render :new
    end
  end

  def list_of_standards
    respond_to do |format|
      format.json do
        course = Course.find params[:course_id]
        render :json => course.standards.select([:id, :text, :keywords]).to_json, :status => :ok
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
