class Delivery < ActiveRecord::Base
  belongs_to :lesson

  def self.get_dates_for_calendar_in(range)
    deliveries = self.includes(:lesson).where(date: range).select([:lesson_id, :date])
    deliveries.map do |delivery|
      {
        title: delivery.lesson.try(:title),
        start: delivery.date
      }
    end
  end
end
