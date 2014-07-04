class CoursesController < InheritedResources::Base
  before_filter :fetch_standard_courses, only: [:new]

  def list_of_standards
    respond_to do |format|
      format.json do
        course = Course.find params[:course_id]
        render :json => course.standards.select([:id, :text, :keywords]).to_json, :status => :ok
      end
    end
  end

  private

  def permitted_params
    params.permit(:course => [:title, :standard_course_id, :grade])
  end

  def fetch_standard_courses
    @standard_courses = StandardCourse.select(:id, :name)
  end

end
