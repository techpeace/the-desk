class Course < ActiveRecord::Base
  belongs_to :standard_course
  has_many :standards, :through => :standard_course
  belongs_to :user
  has_many :lessons

  GRADES = %w(K 1 2 3 4 5 6 7 8 HS)
end
