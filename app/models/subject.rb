class Subject < ActiveRecord::Base
	has_many :courses
	has_many :standards, through: :courses
end
