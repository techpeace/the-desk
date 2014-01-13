class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :deliveries, :dependent => :destroy
end