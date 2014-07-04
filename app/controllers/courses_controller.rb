class CoursesController < InheritedResources::Base
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
        render :json => StandardCourse.where(grade: params[:grade]).select(:id, :name), :status => :ok
      end
    end
  end

  private

  def permitted_params
    params.permit(:course => [:title, :standard_course_id, :grade])
  end
end
