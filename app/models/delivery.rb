class Delivery < ActiveRecord::Base
  belongs_to :lesson

  def as_json(options={})
    super(:only => [:date])
  end
end
