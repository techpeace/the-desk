class RenameCourseToStandardCourse < ActiveRecord::Migration
  def change
    rename_table 'courses', 'standard_courses'

    rename_column 'standards', 'course_id', 'standard_course_id'
  end
end
