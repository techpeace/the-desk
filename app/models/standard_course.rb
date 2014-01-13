class StandardCourse < ActiveRecord::Base
  belongs_to :subject
  has_many :standards
end
