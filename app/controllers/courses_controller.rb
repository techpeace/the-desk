class CoursesController < InheritedResources::Base
  before_filter :fetch_standard_courses, only: [:new]

  private

  def permitted_params
    params.permit(:course => [:title, :standard_course_id, :grade])
  end

  def fetch_standard_courses
    @standard_courses = StandardCourse.select(:id, :name)
  end

  protected

  # Ensure courses are scoped to current user.
  def begin_of_association_chain
    current_user
  end
end
