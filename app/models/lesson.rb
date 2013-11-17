class Lesson < ActiveRecord::Base
  belongs_to :user
  has_many :deliveries, :dependent => :destroy
end