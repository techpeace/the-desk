class LessonStandard < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :standard
end
