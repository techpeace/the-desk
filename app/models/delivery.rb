class Delivery < ActiveRecord::Base
  belongs_to :lesson

  def self.get_dates_for_calendar_in(range)
    deliveries = self.where("date" => range)
    deliveries.map do |date|
      {
        title: date.lesson.title,
        start: date.date
      }
    end
  end

  def as_json(options={})
    {
      id: self.id,
      date: self.date ? self.date.strftime("%a, %b %d, %Y ") : nil
    }
  end
end
