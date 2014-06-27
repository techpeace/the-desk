class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  has_many :deliveries, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :ratings

  def average_rating
    begin
      ratings.sum(:score) / ratings.size
    rescue ZeroDivisionError => e
      0
    end
  end
end