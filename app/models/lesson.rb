class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :lesson_standards, :dependent => :destroy
  has_many :standards, :through => :lesson_standards

  has_many :deliveries, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :ratings, :dependent => :destroy

  after_save :clear_lesson_standards

  def average_rating
    begin
      ratings.sum(:score) / ratings.size
    rescue ZeroDivisionError => e
      0
    end
  end

  def clear_lesson_standards
    if course_id_changed?
      lesson_standards.destroy_all
    end
  end

end