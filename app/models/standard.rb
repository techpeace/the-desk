class Standard < ActiveRecord::Base
  belongs_to :subject
  belongs_to :standard_course
  belongs_to :standards_issuer
end
