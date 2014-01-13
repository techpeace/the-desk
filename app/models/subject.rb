class Subject < ActiveRecord::Base
	has_many :standard_courses
	has_many :standards, through: :courses
end
