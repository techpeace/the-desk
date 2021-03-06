class Course < ActiveRecord::Base
  GRADES = %w(K 1 2 3 4 5 6 7 8 HS)

  belongs_to :user
  belongs_to :standard_course
  has_many :standards, ->(course) { where(grade: course.grade) }, :through => :standard_course
  has_many :lessons
  has_many :lesson_standards, :through => :lessons, :dependent => :destroy
  has_many :assigned_standards, :source => :standard, :through => :lesson_standards

  validates_presence_of :standard_course, message: "You must assign a standard set."

  def unassigned_standards
    standards.where.not(id: assigned_standards.pluck(:id))
  end

end
