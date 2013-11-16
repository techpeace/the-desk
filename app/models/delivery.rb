class Delivery < ActiveRecord::Base
  belongs_to :lesson

  def as_json(options={})
    {
      id: self.id,
      date: self.date ? self.date.strftime("%a, %b %d, %Y ") : nil
    }
  end
end
