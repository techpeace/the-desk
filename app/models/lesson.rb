class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  has_many :deliveries, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :ratings
end